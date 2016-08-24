package com.plasmid.table;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "plasmid")
public class Plasmidsdetail {
	@Id
	@GeneratedValue
	private int id;
	private int nr;
	private String experimentor;
	private String plasmidname;	
	private String supplier;
	private String cloningsites;
	private String insertaa;
	private String donororganism;
	private String resistance;
	private String amresistance;
	private String tags;
	private String promoter;
	private String begin;
	private String end;
	private String comment;
	private String purity;
	private String map;
	private String parentalvector;
	private String disposed;
	private String vektorbackbone;
	private int boxnr;
	private String hostorganism;
	private String fullclone;
	private String specialincidents;
	private String safetylevel;
	
	

	
	public int getNr() {
		return nr;
	}
	public String getExperimentor() {
		return experimentor;
	}

	public String getPlasmidname() {
		return plasmidname;
	}
	public String getSupplier() {
		return supplier;
	}
	public String getCloningsites() {
		return cloningsites;
	}
	public String getInsertaa() {
		return insertaa;
	}
	public String getDonororganism() {
		return donororganism;
	}
	public String getResistance() {
		return resistance;
	}
	public String getAmresistance() {
		return amresistance;
	}
	public String getTags() {
		return tags;
	}
	public String getPromoter() {
		return promoter;
	}
	public String getBegin() {
		return begin;
	}
	public String getEnd() {
		return end;
	}
	public String getComment() {
		return comment;
	}
	public String getPurity() {
		return purity;
	}
	public String getMap() {
		return map;
	}
	public String getParentalvector() {
		return parentalvector;
	}
	public String getDisposed() {
		return disposed;
	}
	public String getVektorbackbone() {
		return vektorbackbone;
	}
	public int getBoxnr() {
		return boxnr;
	}
	
	public String getHostorganism() {
		return hostorganism;
	}
	
	public String getFullclone() {
		return fullclone;
	}
	
	public String getSpecialincidents() {
		return specialincidents;
	}
	
	public String getSafetylevel() {
		return safetylevel;
	}
	
	
	
	public void setNr(int n) {
		this.nr=n;
	}
	public void setExperimentor(String ex) {
		this.experimentor=ex;
	}

	public void setPlasmidname(String pla) {
		this.plasmidname=pla;
	}
	public void setSupplier(String su) {
		this.supplier=su;
	}
	public void setCloningsites(String cl) {
		this.cloningsites=cl;
	}
	public void setInsertaa(String in) {
		this.insertaa=in;
	}
	public void setDonororganism(String don) {
		this.donororganism=don;
	}
	public void setResistance(String re) {
		this.resistance=re;
	}
	public void setAmresistance(String res) {
		this.amresistance=res;
	}
	public void setTags(String ta) {
		this.tags=ta;
	}
	public void setPromoter(String pr) {
		this.promoter=pr;
	}
	public void setBegin(String be) {
		this.begin=be;
	}
	public void setEnd(String en) {
		this.end=en;
	}
	public void setComment(String co) {
		this.comment=co;
	}
	public void setPurity(String pu) {
		this.purity=pu;
	}
	public void setMap(String ma) {
		this.map=ma;
	}
	public void setParentalvector(String pa) {
		this.parentalvector=pa;
	}
	public void setDisposed(String di) {
		this.disposed=di;
	}
	public void setVectorbackbone(String ve) {
		this.vektorbackbone=ve;
	}
	public void setBoxnr(int bo) {
		this.boxnr=bo;
	}
	
	public void setHostorganism(String ve) {
		this.hostorganism=ve;
	}
	
	public void setFullclone(String ve) {
		this.fullclone=ve;
	}
	
	public void setSpecialincidents(String ve) {
		this.specialincidents=ve;
	}
	
	public void setSafetylevel(String ve) {
		this.safetylevel=ve;
	}

}