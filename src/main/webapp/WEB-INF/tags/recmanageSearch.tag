<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="current" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
    .board-search-container{
        margin: 15px 0px 60px 0px;
        display: flex;
        justify-content: center;
        align-items:  center;
    }
    .board-search-container > select {
        border: 0.5px solid rgba(0,0,0,0.2);
        margin-right: 10px;
    }
    .board-searchbar-div{
        display: inline;
        position: relative;
    }
    .search-input{
        border-radius: 15px;
        border-top-right-radius: 0px;
        border-bottom-right-radius: 0px;
        border: 0.5px solid rgba(0,0,0,0.2);
        outline: none;
        padding: 5px 15px;
    }
    .search-button{
        position: absolute;
        border: 0.5px solid rgba(0,0,0,0.2);
        border-radius:15px;
        border-top-left-radius: 0px;
        border-bottom-left-radius: 0px;
        height: 36px;
        width: 40px;
    }
    .search-button > i{
        color: rgba(0,0,0,0.7);
    }
    .search-select{
        border: none;
        border-radius: 15px;
        padding: 5px;
        appearance:none;
        border: 0.1px solid rgba(0,0,0,0.2);
    }
</style>
<div style="display: flex; justify-content: center;">

    <div class="board-search-container">
        <form action="/admin/recruiter/recruitmanage" role="search">
            <select  class="search-select" name="type" style="width: 120px;">
                <option value="title"${param.type eq 'title' ? 'selected' : '' }>공고명</option>
                <option value="memberId"${param.type eq 'memberId' ? 'selected' : '' }>담당자</option>
                <option value="address"${param.type eq 'address' ? 'selected' : '' }>주소</option>
            </select>
            <div class="board-searchbar-div">
                <input class="search-input" type="search" name="search" placeholder="키워드를 입력해주세요" aria-label="Search" value="${param.search }" style="width: 420px;"/>
                <button class="search-button"><i class="fa-solid fa-magnifying-glass"></i></button>
            </div>
        </form>
    </div>
</div>