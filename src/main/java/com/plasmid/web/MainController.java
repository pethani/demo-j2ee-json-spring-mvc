package com.plasmid.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.plasmid.DAO.*;
import com.plasmid.table.*;

@Controller
@RequestMapping("/")
@SessionAttributes({ "user", "nrdownload" })
public class MainController {

	private int box_length = 81;
	private String saveDirectory = "/opt/plasmidmap";
	// private String saveDirectory = "/";
	@Autowired
	private LoginDAO loginDAO;
	@Autowired
	public PlasmidsdetailDAO plasmidDAO;

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public String home(Model model) {
		return "login";
	}

	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String list(HttpServletRequest request, Model model) {

		String username = request.getParameter("txtuname");
		String pass = request.getParameter("txtpass");
		List<Login> logindata = loginDAO.findAll();
		Login logintemp;
		int i, len = logindata.size();
		for (i = 0; i < len; i++) {
			logintemp = logindata.get(i);
			if (username.equals(logintemp.getUsername())) {
				if (pass.equals(logintemp.getPassword())) {
					request.getSession().setMaxInactiveInterval(2 * 60 * 60);
					model.addAttribute("user", username);
					model.addAttribute("files", null);
					model.addAttribute("dublicate", false);
					List<Plasmidsdetail> plasmidall = plasmidDAO.getAll();
					model.addAttribute("data", plasmidall);

					return "home";
				} else {
					model.addAttribute("userfalse", false);
					model.addAttribute("passfalse", true);
					return "login";
				}
			}
		}
		model.addAttribute("userfalse", true);
		model.addAttribute("passfalse", false);
		return "login";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			List<Plasmidsdetail> plasmidall = plasmidDAO.getAll();
			model.addAttribute("data", plasmidall);
			return "home";
		}
	}

	@RequestMapping(value = "/addplasmid", method = RequestMethod.GET)
	public String addplasmid(Model model, HttpSession session) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			String fname = logindata.get(0).getFirstname();
			String lname = logindata.get(0).getLastname();
			List<Plasmidsdetail> plasmidall = plasmidDAO.getAll();
			int l = plasmidall.size();
			int n = plasmidall.get(l - 1).getNr() + 1;
			String fullname = fname + " " + lname;
			int modul = n / box_length;
			modul++;
			model.addAttribute("nr", n);
			model.addAttribute("boxnr", modul);
			model.addAttribute("name", fullname);
			return "addplasmid";
		}

	}

	@RequestMapping(value = "/addplasmid", method = RequestMethod.POST)
	public String addplasmidhandel(
			@ModelAttribute("uploadForm") FileUploadForm uploadForm,
			HttpServletRequest req, Model model, HttpSession session)
			throws IllegalStateException, IOException {

		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			int nr = Integer.parseInt(req.getParameter("txtnr"));
			String experimentor = req.getParameter("txtexperimentor");
			String plasmidname = req.getParameter("txtplasmidname");
			String supplier = req.getParameter("txtsupplier");
			String cloningsites = req.getParameter("txtcloningsites");
			String insert = req.getParameter("txtinsert");
			String donororganism = req.getParameter("txtdonororganism");
			String resistence = req.getParameter("txtresistence");
			String resistencemam = req.getParameter("txtresistencemam");
			String tags = req.getParameter("txttags");
			String promoter = req.getParameter("txtpromoter");
			String begin = (String) req.getParameter("txtbegin");
			String end = (String) req.getParameter("txtend");
			String comment = req.getParameter("txtcomment");
			String purity = req.getParameter("txtpurity");
			String parentalvector = req.getParameter("txtparentalvector");
			String disposed = req.getParameter("txtdisposed");
			String vectorbackbone = req.getParameter("txtvectorbackbone");
			int boxnr = Integer.parseInt(req.getParameter("txtboxnr"));
			String hostorganism = req.getParameter("txthostorganism");
			String fullclonename = req.getParameter("txtfullclonename");
			String specialincidents = req.getParameter("txtspecialincidents");
			String safetylevel = req.getParameter("txtsafetylevel");

			List<MultipartFile> files = uploadForm.getFiles();
			Plasmidsdetail newplas = new Plasmidsdetail();
			String filename = files.get(0).getOriginalFilename();
			if (!(filename.length() == 0)) {
				String type = files.get(0).getContentType();
				if (type.equals("text/plain")) {
					File newfile = new File(saveDirectory, nr + ".txt");
					newfile.delete();
					files.get(0).transferTo(newfile);
					newplas.setMap("Available");
					model.addAttribute("type", true);
				} else {
					int modul = (nr - 1) / box_length;
					modul++;
					model.addAttribute("boxnr", modul);
					model.addAttribute("file", filename);
					model.addAttribute("type", false);
					model.addAttribute("add", false);
					model.addAttribute("nrold", nr);
					model.addAttribute("nr", nr);
					model.addAttribute("name", experimentor);
					return "addplasmid";
				}
			} else {
				newplas.setMap("Not Available");
			}

			newplas.setNr(nr);
			newplas.setExperimentor(experimentor);
			newplas.setPlasmidname(plasmidname);
			newplas.setSupplier(supplier);
			newplas.setCloningsites(cloningsites);
			newplas.setInsertaa(insert);
			newplas.setDonororganism(donororganism);
			newplas.setResistance(resistence);
			newplas.setAmresistance(resistencemam);
			newplas.setTags(tags);
			newplas.setPromoter(promoter);
			newplas.setBegin(begin);
			newplas.setEnd(end);
			newplas.setComment(comment);
			newplas.setPurity(purity);
			newplas.setParentalvector(parentalvector);
			newplas.setDisposed(disposed);
			newplas.setVectorbackbone(vectorbackbone);
			newplas.setBoxnr(boxnr);
			newplas.setHostorganism(hostorganism);
			newplas.setFullclone(fullclonename);
			newplas.setSpecialincidents(specialincidents);
			newplas.setSafetylevel(safetylevel);

			plasmidDAO.addPlasmid(newplas);
			int modul = (nr) / box_length;
			modul++;
			model.addAttribute("boxnr", modul);
			model.addAttribute("add", true);
			model.addAttribute("nrold", nr);
			model.addAttribute("nr", nr + 1);
			model.addAttribute("name", experimentor);
			return "addplasmid";
		}

	}

	@RequestMapping(value = { "/deleteplasmid" }, method = RequestMethod.GET)
	public String deleteplasmid(HttpSession session, Model model,
			HttpServletRequest request) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			List<Plasmidsdetail> plasmidall = plasmidDAO.getByname(logindata
					.get(0).getFirstname()
					+ " "
					+ logindata.get(0).getLastname());
			model.addAttribute("data", plasmidall);
			return "deleteplasmid";
		}
	}

	@RequestMapping(value = { "/deleteplasmid" }, method = RequestMethod.POST)
	public String deleteplasmidhandel(HttpSession session, Model model,
			HttpServletRequest request) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			try {
				int nr = Integer.parseInt(request.getParameter("txtnr"));
				List<Plasmidsdetail> plasmid = plasmidDAO.getSpecific(nr);
				int l = plasmid.size();
				if (l == 0) {
					model.addAttribute("number", false);
				} else {
					int j;
					if (plasmid
							.get(0)
							.getExperimentor()
							.equals(logindata.get(0).getFirstname() + " "
									+ logindata.get(0).getLastname())) {
						plasmidDAO.Delete(nr);
						File file = new File(saveDirectory + nr + ".txt");
						file.delete();
						List<Plasmidsdetail> allplasmid = plasmidDAO.getAll();
						int total = allplasmid.size(), pnr, modulo;
						Plasmidsdetail tempplasmid;
						for (j = 0; j < total; j++) {
							tempplasmid = allplasmid.get(j);
							pnr = tempplasmid.getNr();
							modulo = (pnr - 1) / box_length;
							modulo++;
							if (!(tempplasmid.getBoxnr() == modulo)) {
								plasmidDAO.changeBoxnr(pnr, modulo);
							}
						}

						model.addAttribute("delete", true);
						model.addAttribute("n", nr);
					} else {
						model.addAttribute("number", false);
					}
				}
			} catch (java.lang.NumberFormatException e) {
				model.addAttribute("format", false);
				List<Plasmidsdetail> plasmidall = plasmidDAO
						.getByname(logindata.get(0).getFirstname() + " "
								+ logindata.get(0).getLastname());
				model.addAttribute("data", plasmidall);
				return "deleteplasmid";
			}
			List<Plasmidsdetail> plasmidall = plasmidDAO.getByname(logindata
					.get(0).getFirstname()
					+ " "
					+ logindata.get(0).getLastname());
			model.addAttribute("data", plasmidall);
			return "deleteplasmid";
		}
	}

	@RequestMapping(value = { "/printout" }, method = RequestMethod.GET)
	public String print(HttpSession session, Model model,
			HttpServletRequest request) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			return "printout";
		}

	}

	@RequestMapping(value = { "/printout" }, method = RequestMethod.POST)
	public String printout(HttpSession session, Model model,
			HttpServletRequest request) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			try {
				int nr = Integer.parseInt(request.getParameter("txtnr"));

				List<Plasmidsdetail> plasmid = plasmidDAO.getSpecific(nr);
				int l = plasmid.size();
				if (l == 0) {
					model.addAttribute("number", false);
				} else {
					Plasmidsdetail obj = plasmid.get(0);
					String plasname = obj.getPlasmidname();
					String donor = obj.getDonororganism();
					String begin = obj.getBegin();
					String end = obj.getEnd();
					String exname = obj.getExperimentor();
					String disposed = obj.getDisposed();
					String hostorganism = obj.getHostorganism();
					String fullclonename = obj.getFullclone();
					String specialincidents = obj.getSpecialincidents();
					String safetylevel = obj.getSafetylevel();

					model.addAttribute("pdf", true);
					model.addAttribute("n", nr);
					model.addAttribute("pla", plasname);
					model.addAttribute("don", donor);
					model.addAttribute("beg", begin);
					model.addAttribute("en", end);
					model.addAttribute("exnam", exname);
					model.addAttribute("dis", disposed);
					model.addAttribute("hostorganism", hostorganism);
					model.addAttribute("fullclonename", fullclonename);
					model.addAttribute("specialincidents", specialincidents);
					model.addAttribute("safetylevel", safetylevel);

				}
			} catch (java.lang.NumberFormatException e) {
				model.addAttribute("format", false);
				return "printout";
			}
			return "printout";
		}

	}

	@RequestMapping(value = { "/label" }, method = RequestMethod.GET)
	public String label(HttpSession session, Model model,
			HttpServletRequest request) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			return "label";
		}
	}

	@RequestMapping(value = { "/label" }, method = RequestMethod.POST)
	public String labelpost(HttpSession session, Model model,
			HttpServletRequest request) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			String[] nrlist;
			String nrs = request.getParameter("txtnr");
			nrlist = nrs.split(",");
			int l, size = nrlist.length, nr, temp = 0;
			List<Plasmidsdetail> plasmid = Collections.emptyList();
			List<Plasmidsdetail> plasall = Collections.emptyList();
			try {

				for (int i = 0; i < size; i++) {
					nr = Integer.parseInt(nrlist[i]);
					plasmid = plasmidDAO.getSpecific(nr);
					l = plasmid.size();
					if (l == 0) {

					} else {
						if (temp == 0) {
							plasall = plasmid;
							temp = 1;
						} else {
							plasall.add(plasmid.get(0));
						}
					}
				}
			} catch (java.lang.NumberFormatException e) {
				model.addAttribute("format", false);
				return "label";
			}

			if (plasall.isEmpty()) {
				model.addAttribute("number", false);
			} else {
				l = plasall.size();
				model.addAttribute("pdf", true);
				model.addAttribute("plasmidall", plasall);
				model.addAttribute("size", l);

			}
			return "label";
		}
	}

	@RequestMapping(value = { "/alllabel" }, method = RequestMethod.POST)
	public String alllabelpost(HttpSession session, Model model,
			HttpServletRequest request) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			List<Plasmidsdetail> plasall = plasmidDAO.getAll();
			int l = plasall.size();
			model.addAttribute("pdfall", true);
			model.addAttribute("plasmidall", plasall);
			model.addAttribute("size", l);
			return "label";
		}
	}

	@RequestMapping(value = { "/map" }, method = RequestMethod.GET)
	public String map(HttpSession session, Model model,
			HttpServletRequest request) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			return "map";
		}

	}

	@RequestMapping(value = { "/mapdownload" }, method = RequestMethod.POST)
	public String mapdownload(HttpSession session, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			try {
				int nr = Integer.parseInt(request.getParameter("txtnr"));

				List<Plasmidsdetail> plasmid = plasmidDAO.getSpecific(nr);
				int l = plasmid.size();
				if (l == 0) {
					model.addAttribute("number", false);
				} else {
					Plasmidsdetail obj = plasmid.get(0);
					String map = obj.getMap();
					if (map.equals("Available")) {
						model.addAttribute("nrdownload", nr);
						model.addAttribute("mapavailable", true);

					} else {
						model.addAttribute("mapavailable", false);
					}
				}
				model.addAttribute("n", nr);
			} catch (java.lang.NumberFormatException e) {
				model.addAttribute("format", false);
				return "map";
			}
			return "map";
		}

	}

	@RequestMapping(value = { "/mapdownloadfinal" }, method = RequestMethod.GET)
	public void mapdownloadfinal(HttpSession session, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		int nr = (Integer) session.getAttribute("nrdownload");
		try {
			File file = new File(saveDirectory, nr + ".txt");
			InputStream inputStream = new FileInputStream(file);
			response.setContentType("application/force-download");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ nr + ".txt");
			IOUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
		} catch (Exception e) {

		}
	}

	@RequestMapping(value = { "/mapupload" }, method = RequestMethod.POST)
	public String mapupload(
			@ModelAttribute("uploadForm") FileUploadForm uploadForm,
			HttpServletRequest request, Model model, HttpSession session)
			throws IllegalStateException, IOException {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			try {
				int nr = Integer.parseInt(request.getParameter("txtnr"));

				List<Plasmidsdetail> plasmid = plasmidDAO.getSpecific(nr);
				int l = plasmid.size();
				if (l == 0) {
					model.addAttribute("numberup", false);
				} else {
					Plasmidsdetail obj = plasmid.get(0);
					String map = obj.getMap();
					if (map.equals("Available")) {
						model.addAttribute("fileavailable", true);
					} else {
						List<MultipartFile> files = uploadForm.getFiles();
						String filename = files.get(0).getOriginalFilename();
						String type = files.get(0).getContentType();
						if (type.equals("text/plain")) {
							File newfile = new File(saveDirectory, nr + ".txt");
							newfile.delete();
							files.get(0).transferTo(newfile);
							plasmidDAO.changeMap(nr);
							model.addAttribute("type", true);
							model.addAttribute("add", true);
						} else {
							model.addAttribute("file", filename);
							model.addAttribute("type", false);
							model.addAttribute("add", false);
						}
					}
				}
				model.addAttribute("n", nr);
			} catch (java.lang.NumberFormatException e) {
				model.addAttribute("formatup", false);
				return "map";
			}
			return "map";
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, SessionStatus session) {
		session.setComplete();
		return "login";
	}

	@RequestMapping(value = { "/changepass" }, method = RequestMethod.GET)
	public String changepass(HttpSession session, Model model,
			HttpServletRequest request) {
		String username = (String) session.getAttribute("user");
		List<Login> logindata = loginDAO.getUser(username);
		int len = logindata.size();
		if (len == 0) {
			return "login";
		} else {
			List<Plasmidsdetail> plasmidall = plasmidDAO.getAll();
			model.addAttribute("data", plasmidall);
			return "changepass";
		}

	}

	@RequestMapping(value = { "/changepasssub" }, method = RequestMethod.POST)
	public String changepasssub(HttpSession session, Model model,
			HttpServletRequest request) {

		String name = (String) session.getAttribute("user");
		List<Login> login = loginDAO.findAll();
		Login logintemp;
		int i, len = login.size();
		for (i = 0; i < len; i++) {
			logintemp = login.get(i);
			if (logintemp.getUsername().equals(name)) {
				String username = name;
				String currpass = request.getParameter("txtcurrpass");
				String newpass = request.getParameter("txtnewpass");
				String confpass = request.getParameter("txtconfpass");
				if (newpass.equals(confpass)) {
					if (currpass.equals(logintemp.getPassword())) {
						loginDAO.changePass(username, newpass);
						model.addAttribute("passchange", true);
					} else {
						model.addAttribute("passchange", false);
					}
				} else {
					model.addAttribute("passmatch", false);
				}

				return "changepass";
			}
		}
		model.addAttribute("userfalse", false);
		model.addAttribute("passfalse", false);
		return "login";
	}

}