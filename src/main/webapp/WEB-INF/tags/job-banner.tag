<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- start banner Area -->
<section class="banner-area relative" id="home">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row fullscreen d-flex align-items-center justify-content-center">
            <div class="banner-content col-lg-12">
                <h1 class="text-white">
                    <span>1500+</span> Jobs posted last week
                </h1>
                <form action="search.html" class="serach-form-area">
                    <div class="row justify-content-center form-wrap">
                        <div class="col-lg-4 form-cols">
                            <input type="text" class="form-control" name="search" placeholder="what are you looging for?">
                        </div>
                        <div class="col-lg-3 form-cols">
                            <div class="default-select" id="default-selects"">
                            <select>
                                <option value="1">Select area</option>
                                <option value="2">Dhaka</option>
                                <option value="3">Rajshahi</option>
                                <option value="4">Barishal</option>
                                <option value="5">Noakhali</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-3 form-cols">
                        <div class="default-select" id="default-selects2">
                            <select>
                                <option value="1">All Category</option>
                                <option value="2">Medical</option>
                                <option value="3">Technology</option>
                                <option value="4">Goverment</option>
                                <option value="5">Development</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2 form-cols">
                        <button type="button" class="btn btn-info">
                            <span class="lnr lnr-magnifier"></span> Search
                        </button>
                    </div>
            </div>
            </form>
            <p class="text-white"> <span>Search by tags:</span> Tecnology, Business, Consulting, IT Company, Design, Development</p>
        </div>
    </div>
    </div>
</section>
<!-- End banner Area -->