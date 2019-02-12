package com.lwx.pojo;

import java.util.List;

public class EasyUIDatagrid {
	
	//当前页显示的数据
	private List<?> rows;
	//表中数据总个数
	private int total;
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
}
