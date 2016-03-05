package com.common.util;

public class ExcelColumn {

	private String value;

	private int row;

	private int col;

	public ExcelColumn(String value, int row, int col) {
		super();
		this.value = value;
		this.row = row;
		this.col = col;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	public int getCol() {
		return col;
	}

	public void setCol(int col) {
		this.col = col;
	}

}