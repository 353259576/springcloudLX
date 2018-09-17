package org.ws.java.order.model.vo;

import com.google.common.collect.Lists;
import java.io.Serializable;
import java.util.List;

public class PageInfo<T> implements Serializable {
    private List<T> dataList;
    private Integer page;
    private Integer rows;
    private Long totalRows;
    private int totalPage;

    public PageInfo() {
    }

    public List<T> getDataList() {
        return this.dataList;
    }

    public void setDataList(List<T> dataList) {
        if (null != dataList) {
            this.dataList = dataList;
        } else {
            this.dataList = Lists.newArrayList();
        }

    }

    public Integer getPage() {
        return this.page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return this.rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public Long getTotalRows() {
        return this.totalRows;
    }

    public void setTotalRows(Long totalRows) {
        this.totalRows = totalRows;
    }

    public void setPageVO(PageVO pageVO) {
        this.setPage(pageVO.getPage());
        this.setRows(pageVO.getRows());
        if (null != pageVO.getTotalRows()) {
            this.setTotalRows(Long.valueOf((long)pageVO.getTotalRows()));
        } else {
            this.setTotalRows(0L);
        }

    }

    public int getTotalPage() {
        if (null != this.getTotalRows()) {
            if (this.getTotalRows() % (long)this.getRows() == 0L) {
                this.totalPage = this.getTotalRows().intValue() / this.getRows();
            } else {
                this.totalPage = this.getTotalRows().intValue() / this.getRows() + 1;
            }

            return this.totalPage;
        } else {
            return 0;
        }
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
