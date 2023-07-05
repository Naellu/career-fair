<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<html>
<head>
    <title>채용박람회</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/css/main.css">
    <my:font></my:font>
</head>
<body>
    <my:templateNavBar/>


    <!-- ======= Hero Section ======= -->
    <section id="hero" class="hero">
        <div class="container position-relative">
            <div class="row gy-5" data-aos="fade-in">
                <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center text-center text-lg-start">
                    <h2>Welcome to <span>Impact</span></h2>
                    <p>Sed autem laudantium dolores. Voluptatem itaque ea consequatur eveniet. Eum quas beatae cumque eum quaerat.</p>
                    <div class="d-flex justify-content-center justify-content-lg-start">
                        <a href="#about" class="btn-get-started">Get Started</a>
                        <a href="https://www.youtube.com/watch?v=LXb3EKWsInQ" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>
                    </div>
                </div>
                <div class="col-lg-6 order-1 order-lg-2">
                    <img src="/img/main/visual_img.png" class="img-fluid" alt="" data-aos="zoom-out" data-aos-delay="100">
                </div>
            </div>
        </div>

        <div class="icon-boxes position-relative">
            <div class="container position-relative">
                <div class="row gy-4 mt-5">

                    <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
                        <div class="icon-box">
                            <div class="icon"><i class="bi bi-easel"></i></div>
                            <h4 class="title"><a href="" class="stretched-link">Lorem Ipsum</a></h4>
                        </div>
                    </div><!--End Icon Box -->

                    <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
                        <div class="icon-box">
                            <div class="icon"><i class="bi bi-gem"></i></div>
                            <h4 class="title"><a href="" class="stretched-link">Sed ut perspiciatis</a></h4>
                        </div>
                    </div><!--End Icon Box -->

                    <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="300">
                        <div class="icon-box">
                            <div class="icon"><i class="bi bi-geo-alt"></i></div>
                            <h4 class="title"><a href="" class="stretched-link">Magni Dolores</a></h4>
                        </div>
                    </div><!--End Icon Box -->

                    <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="500">
                        <div class="icon-box">
                            <div class="icon"><i class="bi bi-command"></i></div>
                            <h4 class="title"><a href="" class="stretched-link">Nemo Enim</a></h4>
                        </div>
                    </div><!--End Icon Box -->

                </div>
            </div>
        </div>

        </div>
    </section>
    <!-- End Hero Section -->

    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
        <div class="container" data-aos="fade-up">

            <div class="section-header">
                <h2>About Us</h2>
                <p>Aperiam dolorum et et wuia molestias qui eveniet numquam nihil porro incidunt dolores placeat sunt id nobis omnis tiledo stran delop</p>
            </div>

            <div class="row gy-4">
                <div class="col-lg-6">
                    <h3>Voluptatem dignissimos provident quasi corporis</h3>
                    <img src="assets/img/about.jpg" class="img-fluid rounded-4 mb-4" alt="">
                    <p>Ut fugiat ut sunt quia veniam. Voluptate perferendis perspiciatis quod nisi et. Placeat debitis quia recusandae odit et consequatur voluptatem. Dignissimos pariatur consectetur fugiat voluptas ea.</p>
                    <p>Temporibus nihil enim deserunt sed ea. Provident sit expedita aut cupiditate nihil vitae quo officia vel. Blanditiis eligendi possimus et in cum. Quidem eos ut sint rem veniam qui. Ut ut repellendus nobis tempore doloribus debitis explicabo similique sit. Accusantium sed ut omnis beatae neque deleniti repellendus.</p>
                </div>
                <div class="col-lg-6">
                    <div class="content ps-0 ps-lg-5">
                        <p class="fst-italic">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                            magna aliqua.
                        </p>
                        <ul>
                            <li><i class="bi bi-check-circle-fill"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                            <li><i class="bi bi-check-circle-fill"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
                            <li><i class="bi bi-check-circle-fill"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</li>
                        </ul>
                        <p>
                            Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                            velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident
                        </p>

                        <div class="position-relative mt-4">
                            <img src="assets/img/about-2.jpg" class="img-fluid rounded-4" alt="">
                            <a href="https://www.youtube.com/watch?v=LXb3EKWsInQ" class="glightbox play-btn"></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section><!-- End About Us Section -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="/css/main.css">
</body>
</html>
