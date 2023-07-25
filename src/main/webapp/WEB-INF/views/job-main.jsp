<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="/img/job-img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="codepixer">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>Job Listing</title>

<%--    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">--%>
    <!--
    CSS
    ============================================= -->
    <link rel="stylesheet" href="/css/job-css/linearicons.css">
<%--    <link rel="stylesheet" href="/css/job-css/font-awesome.min.css">--%>
    <link rel="stylesheet" href="/css/job-css/bootstrap.css">
    <link rel="stylesheet" href="/css/job-css/magnific-popup.css">
    <link rel="stylesheet" href="/css/job-css/nice-select.css">
    <link rel="stylesheet" href="/css/job-css/animate.min.css">
    <link rel="stylesheet" href="/css/job-css/owl.carousel.css">
    <link rel="stylesheet" href="/css/job-css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<my:font />
<my:job-header-nav />


<my:job-banner />


<!-- Start features Area -->
<section class="features-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>Searching</h4>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing.
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>Applying</h4>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing.
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>Security</h4>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing.
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>Notifications</h4>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End features Area -->

<!-- Start popular-post Area -->
<section class="popular-post-area pt-100">
    <div class="container">
        <div class="row align-items-center">
            <div class="active-popular-post-carusel">
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb">
                        <img class="img-fluid" src="/img/job-img/p1.png" alt="">
                        <a class="btns text-uppercase" href="#">view job post</a>
                    </div>
                    <div class="details">
                        <a href="#"><h4>Creative Designer</h4></a>
                        <h6>Los Angeles</h6>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.
                        </p>
                    </div>
                </div>
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/p2.png" alt="">
                        <a class="btns text-uppercase" href="#">view job post</a>
                    </div>
                    <div class="details">
                        <a href="#"><h4>Creative Designer</h4></a>
                        <h6>Los Angeles</h6>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.
                        </p>
                    </div>
                </div>
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/p1.png" alt="">
                        <a class="btns text-uppercase" href="#">view job post</a>
                    </div>
                    <div class="details">
                        <a href="#"><h4>Creative Designer</h4></a>
                        <h6>Los Angeles</h6>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.
                        </p>
                    </div>
                </div>
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/p2.png" alt="">
                        <a class="btns text-uppercase" href="#">view job post</a>
                    </div>
                    <div class="details">
                        <a href="#"><h4>Creative Designer</h4></a>
                        <h6>Los Angeles</h6>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.
                        </p>
                    </div>
                </div>
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/p1.png" alt="">
                        <a class="btns text-uppercase" href="#">view job post</a>
                    </div>
                    <div class="details">
                        <a href="#"><h4>Creative Designer</h4></a>
                        <h6>Los Angeles</h6>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.
                        </p>
                    </div>
                </div>
                <div class="single-popular-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/p2.png" alt="">
                        <a class="btns text-uppercase" href="#">view job post</a>
                    </div>
                    <div class="details">
                        <a href="#"><h4>Creative Designer</h4></a>
                        <h6>Los Angeles</h6>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End popular-post Area -->

<!-- Start feature-cat Area -->
<section class="feature-cat-area pt-100" id="category">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-10">
                <div class="title text-center">
                    <h1 class="mb-10">Featured Job Categories</h1>
                    <p>Who are in extremely love with eco friendly system.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="/img/job-img/o1.png" alt="">
                    </a>
                    <p>Accounting</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="/img/job-img/o2.png" alt="">
                    </a>
                    <p>Development</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="/img/job-img/o3.png" alt="">
                    </a>
                    <p>Technology</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="/img/job-img/o4.png" alt="">
                    </a>
                    <p>Media & News</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="/img/job-img/o5.png" alt="">
                    </a>
                    <p>Medical</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="/img/job-img/o6.png" alt="">
                    </a>
                    <p>Goverment</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End feature-cat Area -->

<!-- Start post Area -->
<section class="post-area section-gap">
    <div class="container">
        <div class="row justify-content-center d-flex">
            <div class="col-lg-8 post-list">
                <ul class="cat-list">
                    <li><a href="#">Recent</a></li>
                    <li><a href="#">Full Time</a></li>
                    <li><a href="#">Intern</a></li>
                    <li><a href="#">part Time</a></li>
                </ul>
                <div class="single-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/post.png" alt="">
                        <ul class="tags">
                            <li>
                                <a href="#">Art</a>
                            </li>
                            <li>
                                <a href="#">Media</a>
                            </li>
                            <li>
                                <a href="#">Design</a>
                            </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles">
                                <a href="single.html"><h4>개발자</h4></a>
                                <h6>라벨</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a></li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
                        </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/post.png" alt="">
                        <ul class="tags">
                            <li>
                                <a href="#">Art</a>
                            </li>
                            <li>
                                <a href="#">Media</a>
                            </li>
                            <li>
                                <a href="#">Design</a>
                            </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles">
                                <a href="single.html"><h4>Creative Art Designer</h4></a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a></li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
                        </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/post.png" alt="">
                        <ul class="tags">
                            <li>
                                <a href="#">Art</a>
                            </li>
                            <li>
                                <a href="#">Media</a>
                            </li>
                            <li>
                                <a href="#">Design</a>
                            </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles">
                                <a href="single.html"><h4>Creative Art Designer</h4></a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a></li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
                        </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/post.png" alt="">
                        <ul class="tags">
                            <li>
                                <a href="#">Art</a>
                            </li>
                            <li>
                                <a href="#">Media</a>
                            </li>
                            <li>
                                <a href="#">Design</a>
                            </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles">
                                <a href="single.html"><h4>Creative Art Designer</h4></a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a></li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
                        </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/post.png" alt="">
                        <ul class="tags">
                            <li>
                                <a href="#">Art</a>
                            </li>
                            <li>
                                <a href="#">Media</a>
                            </li>
                            <li>
                                <a href="#">Design</a>
                            </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles">
                                <a href="single.html"><h4>Creative Art Designer</h4></a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a></li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
                        </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/post.png" alt="">
                        <ul class="tags">
                            <li>
                                <a href="#">Art</a>
                            </li>
                            <li>
                                <a href="#">Media</a>
                            </li>
                            <li>
                                <a href="#">Design</a>
                            </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles">
                                <a href="single.html"><h4>Creative Art Designer</h4></a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a></li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
                        </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
                    </div>
                </div>
                <div class="single-post d-flex flex-row">
                    <div class="thumb">
                        <img src="/img/job-img/post.png" alt="">
                        <ul class="tags">
                            <li>
                                <a href="#">Art</a>
                            </li>
                            <li>
                                <a href="#">Media</a>
                            </li>
                            <li>
                                <a href="#">Design</a>
                            </li>
                        </ul>
                    </div>
                    <div class="details">
                        <div class="title d-flex flex-row justify-content-between">
                            <div class="titles">
                                <a href="single.html"><h4>Creative Art Designer</h4></a>
                                <h6>Premium Labels Limited</h6>
                            </div>
                            <ul class="btns">
                                <li><a href="#"><span class="lnr lnr-heart"></span></a></li>
                                <li><a href="#">Apply</a></li>
                            </ul>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
                        </p>
                        <h5>Job Nature: Full time</h5>
                        <p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
                        <p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
                    </div>
                </div>

                <a class="text-uppercase loadmore-btn mx-auto d-block" href="category.html">Load More job Posts</a>

            </div>
            <div class="col-lg-4 sidebar">
                <div class="single-slidebar">
                    <h4>Jobs by Location</h4>
                    <ul class="cat-list">
                        <li><a class="justify-content-between d-flex" href="category.html"><p>New York</p><span>37</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Park Montana</p><span>57</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Atlanta</p><span>33</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Arizona</p><span>36</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Florida</p><span>47</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Rocky Beach</p><span>27</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Chicago</p><span>17</span></a></li>
                    </ul>
                </div>

                <div class="single-slidebar">
                    <h4>Top rated job posts</h4>
                    <div class="active-relatedjob-carusel">
                        <div class="single-rated">
                            <img class="img-fluid" src="/img/job-img/r1.jpg" alt="">
                            <a href="single.html"><h4>Creative Art Designer</h4></a>
                            <h6>Premium Labels Limited</h6>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
                            </p>
                            <h5>Job Nature: Full time</h5>
                            <p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
                            <p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
                            <a href="#" class="btns text-uppercase">Apply job</a>
                        </div>
                        <div class="single-rated">
                            <img class="img-fluid" src="/img/job-img/r1.jpg" alt="">
                            <a href="single.html"><h4>Creative Art Designer</h4></a>
                            <h6>Premium Labels Limited</h6>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
                            </p>
                            <h5>Job Nature: Full time</h5>
                            <p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
                            <p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
                            <a href="#" class="btns text-uppercase">Apply job</a>
                        </div>
                        <div class="single-rated">
                            <img class="img-fluid" src="/img/job-img/r1.jpg" alt="">
                            <a href="single.html"><h4>Creative Art Designer</h4></a>
                            <h6>Premium Labels Limited</h6>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporinc ididunt ut dolore magna aliqua.
                            </p>
                            <h5>Job Nature: Full time</h5>
                            <p class="address"><span class="lnr lnr-map"></span> 56/8, Panthapath Dhanmondi Dhaka</p>
                            <p class="address"><span class="lnr lnr-database"></span> 15k - 25k</p>
                            <a href="#" class="btns text-uppercase">Apply job</a>
                        </div>
                    </div>
                </div>

                <div class="single-slidebar">
                    <h4>Jobs by Category</h4>
                    <ul class="cat-list">
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Technology</p><span>37</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Media & News</p><span>57</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Goverment</p><span>33</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Medical</p><span>36</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Restaurants</p><span>47</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Developer</p><span>27</span></a></li>
                        <li><a class="justify-content-between d-flex" href="category.html"><p>Accounting</p><span>17</span></a></li>
                    </ul>
                </div>

                <div class="single-slidebar">
                    <h4>Carrer Advice Blog</h4>
                    <div class="blog-list">
                        <div class="single-blog " style="background:#000 url(static/img/job-img/blog1.jpg);">
                            <a href="single.html"><h4>Home Audio Recording <br>
                                For Everyone</h4></a>
                            <div class="meta justify-content-between d-flex">
                                <p>
                                    02 Hours ago
                                </p>
                                <p>
                                    <span class="lnr lnr-heart"></span>
                                    06
                                    <span class="lnr lnr-bubble"></span>
                                    02
                                </p>
                            </div>
                        </div>
                        <div class="single-blog " style="background:#000 url(static/img/job-img/blog2.jpg);">
                            <a href="single.html"><h4>Home Audio Recording <br>
                                For Everyone</h4></a>
                            <div class="meta justify-content-between d-flex">
                                <p>
                                    02 Hours ago
                                </p>
                                <p>
                                    <span class="lnr lnr-heart"></span>
                                    06
                                    <span class="lnr lnr-bubble"></span>
                                    02
                                </p>
                            </div>
                        </div>
                        <div class="single-blog " style="background:#000 url(static/img/job-img/blog1.jpg);">
                            <a href="single.html"><h4>Home Audio Recording <br>
                                For Everyone</h4></a>
                            <div class="meta justify-content-between d-flex">
                                <p>
                                    02 Hours ago
                                </p>
                                <p>
                                    <span class="lnr lnr-heart"></span>
                                    06
                                    <span class="lnr lnr-bubble"></span>
                                    02
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- End post Area -->


<!-- Start callto-action Area -->
<section class="callto-action-area section-gap" id="join">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content col-lg-9">
                <div class="title text-center">
                    <h1 class="mb-10 text-white">Join us today without any hesitation</h1>
                    <p class="text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore  et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
                    <a class="primary-btn" href="#">I am a Candidate</a>
                    <a class="primary-btn" href="#">Request Free Demo</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End calto-action Area -->

<!-- Start download Area -->
<section class="download-area section-gap" id="app">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 download-left">
                <img class="img-fluid" src="/img/job-img/d1.png" alt="">
            </div>
            <div class="col-lg-6 download-right">
                <h1>홍길동</h1>
                <p class="subs">
                    마이페이지 입니다
                </p>
                <div class="d-flex flex-row">
                    <div class="buttons">
                        <i class="fa fa-apple" aria-hidden="true"></i>
                        <div class="desc">
                            <a href="#">
                                <p>
                                    <span>Available</span> <br>
                                    on App Store
                                </p>
                            </a>
                        </div>
                    </div>
                    <div class="buttons">
                        <i class="fa fa-android" aria-hidden="true"></i>
                        <div class="desc">
                            <a href="#">
                                <p>
                                    <span>Available</span> <br>
                                    on Play Store
                                </p>
                            </a>
                        </div>
                    </div>
                    <br>
                    <div>

                        <div class="buttons">
                            <i class="fa fa-android" aria-hidden="true"></i>
                            <div class="desc">
                                <a href="#">
                                    <p>
                                        <span>Available</span> <br>
                                        on Play Store
                                    </p>
                                </a>
                            </div>
                        </div>
                        <div class="buttons">
                            <i class="fa fa-android" aria-hidden="true"></i>
                            <div class="desc">
                                <a href="#">
                                    <p>
                                        <span>Available</span> <br>
                                        on Play Store
                                    </p>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- End download Area -->

<my:job-footer />

<script src="/job-js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="/job-js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="/job-js/easing.min.js"></script>
<script src="/job-js/hoverIntent.js"></script>
<script src="/job-js/superfish.min.js"></script>
<script src="/job-js/jquery.ajaxchimp.min.js"></script>
<script src="/job-js/jquery.magnific-popup.min.js"></script>
<script src="/job-js/owl.carousel.min.js"></script>
<script src="/job-js/jquery.sticky.js"></script>
<script src="/job-js/jquery.nice-select.min.js"></script>
<script src="/job-js/parallax.min.js"></script>
<script src="/job-js/mail-script.js"></script>
<script src="/job-js/main.js"></script>
</body>
</html>



