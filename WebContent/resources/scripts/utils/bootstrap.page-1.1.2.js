/*!
 * bootstrap.page.js
 * http://mricle.com/BootstrapPage
 * 
 * Version: 1.1.2
 * Date: 2015-3-22
 * 
 * Copyright 2014, 2015 Mricle
 * Released under the MIT license
 */

!function ($) {
    "use strict";
    var Page = function (element, options) {
        this.defaultOption = {
            pageSize: 10,
            total: 100,
            btnCount: 11,
            showFirstLastBtn: true,
            firstBtnText: null,
            lastBtnText: null,
            prevBtnText: "&laquo;",
            nextBtnText: "&raquo;",
            alwaysShowPage: false,
            click: null,
            remote: {
                url: null,
                params: null,
                callback: null,
            },
            pageIndexName: 'pageIndex',
            pageSizeName: 'pageSize',
            totalName: 'total',
            initRemote: true
        }
        this.currentPageIndex = 0;
        this.$element = $(element);
        this.options = $.extend({}, this.defaultOption, $.fn.page.defaults, options);
        this.total = this.options.total;
        this.options.initRemote && this.options.remote.url ? this.remote(0) : this.render(0);
    }

    Page.prototype.remote = function (pageIndex, params) {
        var that = this;
        if (typeof pageIndex === "object") {
            params = pageIndex;
            pageIndex = that.currentPageIndex;
        }
        if (typeof pageIndex !== "number") {
            pageIndex = that.currentPageIndex;
        }
        if (params)
            this.options.remote.params = params;
        var pageParams = "{'" + this.options.pageIndexName + "':'" + pageIndex + "','"
                                             + this.options.pageSizeName + "':'" + this.options.pageSize + "'}";
        var requestParams = $.extend({}, this.options.remote.params, eval("(" + pageParams + ")"));
        $.post(this.options.remote.url, requestParams, function (result) {
            if (typeof that.options.remote.callback === 'function') {
                that.options.remote.callback(result);
                var total = eval('result.' + that.options.totalName);
                if (total == undefined) { log.error("totalName :  '" + that.options.totalName + "'  not find"); }
                that.total = total;
                that.render(pageIndex);
            } else {
                log.error("remote callback is not function. '");
            }
        });
    }

    Page.prototype.render = function (pageIndex) {
        pageIndex = pageIndex == undefined ? 1 : pageIndex + 1;      //pageIndex索引从一开始，转换以方便计算页数
        if (typeof this.total == 'undefined') { log.error('total is undefined'); }
        var pageCount = this.getPageCount(this.total, this.options.pageSize);
        if (pageCount == 1 && !this.options.alwaysShowPage) return;

        var html = [];

        if (pageCount <= this.options.btnCount) {
            html = this.renderPage(1, pageCount, pageIndex);
        }
        else {
            var firstPage = this.renderPerPage(this.options.firstBtnText || 1, 0);
            var lastPage = this.renderPerPage(this.options.lastBtnText || pageCount, pageCount - 1);
            //两边对称按钮数
            var symmetryBtnCount = (this.options.btnCount - 1 - 2) / 2;
            if (!this.options.showFirstLastBtn)
                symmetryBtnCount = symmetryBtnCount - 1;
            var frontBtnNum = (this.options.btnCount + 1) / 2;
            var behindBtnNum = pageCount - ((this.options.btnCount - 1) / 2);

            if (pageIndex <= frontBtnNum) {
                if (this.options.showFirstLastBtn) {
                    html = this.renderPage(1, this.options.btnCount - 1, pageIndex);
                    html[html.length - 1].find("a").html(this.options.nextBtnText);
                    html.push(lastPage);
                } else {
                    html = this.renderPage(1, this.options.btnCount, pageIndex);
                    html[html.length - 1].find("a").html(this.options.nextBtnText);
                }
            }
            else if (pageIndex >= behindBtnNum) {
                if (this.options.showFirstLastBtn) {
                    html = this.renderPage(pageCount - this.options.btnCount + 2, this.options.btnCount - 1, pageIndex);
                    html[0].find("a").html(this.options.prevBtnText);
                    html.unshift(firstPage);
                } else {
                    html = this.renderPage(pageCount - this.options.btnCount + 1, this.options.btnCount, pageIndex);
                    html[0].find("a").html(this.options.prevBtnText);
                }
            }
            else {
                if (this.options.showFirstLastBtn) {
                    html = this.renderPage(pageIndex - symmetryBtnCount, this.options.btnCount - 2, pageIndex);
                    html[0].find("a").html(this.options.prevBtnText);
                    html[html.length - 1].find("a").html(this.options.nextBtnText);
                    html.unshift(firstPage);
                    html.push(lastPage);
                } else {
                    html = this.renderPage(pageIndex - symmetryBtnCount - 2, this.options.btnCount, pageIndex);
                    html[0].find("a").html(this.options.prevBtnText);
                    html[html.length - 1].find("a").html(this.options.nextBtnText);
                }
            }
        }
        this.$element.empty().append(html);
    }

    Page.prototype.renderPerPage = function (text, value) {
        var $pageBtn = $("<li><a  data-page-index='" + value + "' title='第" + (value + 1) + "页'>" + text + "</a></li>");
        var that = this;
        $pageBtn.find("a").on("click", function (evt) {
            that.currentPageIndex = $(this).data("page-index");
            if (that.options.click) { that.options.click(that.currentPageIndex); }
            typeof that.options.remote.callback === 'function' ? that.remote(that.currentPageIndex) : that.render(that.currentPageIndex);
        });
        return $pageBtn;
    }

    Page.prototype.renderPage = function (beginPageNum, count, currentPage) {
        var html = [];
        for (var i = 0; i < count; i++) {
            var page = this.renderPerPage(beginPageNum, beginPageNum - 1);
            if (beginPageNum == currentPage) { page.addClass("active"); }
            html.push(page);
            beginPageNum++;
        }
        return html;
    }

    Page.prototype.getPageCount = function (total, pageSize) {
        var total = parseInt(total);
        var pageCountStr = (total / pageSize).toString();
        var dotIndex = pageCountStr.indexOf('.');
        return dotIndex == -1 ? parseInt(pageCountStr) : parseInt(pageCountStr.substring(0, dotIndex)) + 1;
    }

    Page.prototype.destroy = function () {
        this.$element.data("page", null).empty();
    }

    $.fn.page = function (option) {
        var args = arguments;
        return this.each(function () {
            var $this = $(this);
            var data = $this.data('page');
            if (!data && typeof option == 'object') {
                var options = typeof option == 'object' && option;
                var data_api_options = {
                    pageSize: $this.data('page-size'),
                    btnCount: $this.data('btn-count'),
                    showFirstLastBtn: $this.data("show-first-last-btn"),
                    firstBtnText: $this.data("first-btn-text"),
                    lastBtnText: $this.data("last-btn-text"),
                    prevBtnText: $this.data("prev-btn-text"),
                    nextBtnText: $this.data("next-btn-text"),
                }
                options = $.extend(options, data_api_options);
                $this.data('page', (data = new Page(this, options)));
            }
            else if (data && typeof option === 'string') {
                data[option].apply(data, Array.prototype.slice.call(args, 1));
            }
            else {
                $this.data('page', (data = new Page(this)));
            }
        });
    }

    $.fn.page.defaults = {
        pageSize: 10,
        total: 100,
        btnCount: 11,
        showFirstLastBtn: true,
        firstBtnText: null,
        lastBtnText: null,
        prevBtnText: "&laquo;",
        nextBtnText: "&raquo;",
        alwaysShowPage: false,
        click: null,
        remote: {
            url: null,
            params: null,
            callback: null,
        },
        pageIndexName: 'pageIndex',
        pageSizeName: 'pageSize',
        totalName: 'total',
        initRemote: true
    }


    var log = {
        info: function (text) {
            if (console) {
                console.info(text);
            }
        },
        error: function (text) {
            if (console) {
                console.error(text);
            }
        }
    }

}(window.jQuery)