package com.morxeen.framework.base.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.morxeen.framework.annotation.ForeignShow;
import com.morxeen.framework.annotation.Header;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "tbl_function")
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class Function extends BaseEntity {

    /**
     *
     */
    private static final long serialVersionUID = 7823895619744279485L;

    @ForeignShow
    @Header(name = "名称")
    @Column(name = "name", length = 50)
    private String name;

    @Header(name = "编码")
    @Column(name = "code", length = 50)
    private String code;

    @Header(name = "url")
    @Column(name = "url", length = 200)
    private String url;

    @Header(name = "父级ID")
    @Column(name = "parent_id")
    private String parentId;

    @Header(name = "层级编码")
    @Column(name = "levelCode", length = 36)
    private String levelCode;

    @Header(name = "图标")
    @Column(name = "icon")
    private String icon;

    // 0=目录 1=功能 2=按钮
    @Header(name = "菜单类型")
    @Column(name = "functype")
    private String functype;

    @Header(name = "备注")
    @Column(name = "remark", length = 1000)
    private String remark;

    @Transient
    private String parentName;

    public String getParentName() {

        return parentName;
    }

    public void setParentName(String parentName) {

        this.parentName = parentName;
    }

    public String getFunctype() {

        return functype;
    }

    public void setFunctype(String functype) {

        this.functype = functype;
    }

    public String getName() {

        return name;
    }

    public void setName(String name) {

        this.name = name;
    }

    public String getCode() {

        return code;
    }

    public void setCode(String code) {

        this.code = code;
    }

    public String getUrl() {

        return url;
    }

    public void setUrl(String url) {

        this.url = url;
    }

    public String getParentId() {

        return parentId;
    }

    public void setParentId(String parentId) {

        this.parentId = parentId;
    }

    public String getLevelCode() {

        return levelCode;
    }

    public void setLevelCode(String levelCode) {

        this.levelCode = levelCode;
    }

    public String getIcon() {

        return icon;
    }

    public void setIcon(String icon) {

        this.icon = icon;
    }

    public String getRemark() {

        return remark;
    }

    public void setRemark(String remark) {

        this.remark = remark;
    }

}
