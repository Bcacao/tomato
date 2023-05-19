<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>


<head>
    <title>MovieHunter</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/assets/css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="/assets/css/detail.css" type="text/css" media="all" />
    <link rel="stylesheet" href="/assets/css/create-rate-modal.css" type="text/css" media="all" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        .rating {
            display: inline-block;
        }

        .rating input {
            display: none;
        }

        .rating label {
            float: right;
            cursor: pointer;
            color: gray;
        }

        .rating label:before {
            content: '\2605';
        }

        .rating input:checked~label {
            color: orange;
        }
    </style>
</head>

<body>>

    <!-- START PAGE SOURCE -->
    <div id="shell">

        <!-- rate-modal  -->
        <!-- <%@ include file="../include/create-rate-modal.jsp" %> -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <form method="POST" action="/submit">
                    <div class="modal-top-box">
                        <div class="modal-top-rate-icon-box">
                            <img src="/assets/img/xapple.png" alt="#" id="modal-rate-icon">
                        </div>
                        <div class="modal-top-rate-input-box">
                            <div class="rating">
                                <input type="radio" id="star5" name="rating" value="5">
                                <label for="star5"></label>
                                <input type="radio" id="star4" name="rating" value="4">
                                <label for="star4"></label>
                                <input type="radio" id="star3" name="rating" value="3">
                                <label for="star3"></label>
                                <input type="radio" id="star2" name="rating" value="2">
                                <label for="star2"></label>
                                <input type="radio" id="star1" name="rating" value="1">
                                <label for="star1"></label>
                            </div>

                        </div>
                        <div class="modal-top-md-box">
                            <div class="modal-top-modify-box">
                                <a id="modal-modify" href="#">수 정</a>
                            </div>
                            <div class="modal-top-delete-box">
                                <a href="#">삭 제</a>
                            </div>
                        </div>
                        <div class="modal-tot-close-button-box">
                            <span class="close">&times;</span>
                        </div>
                    </div>
                    <div class="modal-middle-box">
                        <div class="modal-middle-rate-content-box">
                            <textarea name="modal-content" id="modal-content" cols="30" rows="10"></textarea>
                            <!-- <input type="text" id="rate-content" class="rate-content"> -->
                        </div>
                    </div>
                    <div class="modal-bottom-box">
                        <div class="modal-bottom-left-box">
                            <div class="modal-bottom-movie-title-box">
                                <span class="modal-movie-title">GUARDIANS OF GALAXY VOL. 3</span>
                            </div>
                            <div class="modal-bottom-writer-info-box">
                                <div class="modal-bottom-writer-profile-box">
                                    <img src="/assets/img/people-httpswww.flaticon.com.png" alt="">
                                </div>
                                <div class="modal-bottom-writer-id-score-box">
                                    <div class="modal-bottom-writer-id-box"><span>coticablue2</span></div>
                                    <div class="modal-bottom-writer-score-box"><span>324점</span></div>
                                </div>
                                <div class="modal-bottom-writer-score-icon-box">
                                    <img src="/assets/img/crown.png" alt="#">
                                </div>
                            </div>
                        </div>
                        <div class="modal-bottom-right-box">
                            <div class="modal-bottom-like-box">
                                <div class="modal-bottom-like-icon-box">
                                    <img src="/assets/img/love-httpswww.flaticon.com.png" alt="">
                                </div>
                                <div class="modal-bottom-like-num-box">
                                    <span>123 ♥</span>
                                </div>
                            </div>
                            <div class="modal-bottom-save-button-box">
                                <button id="modal-save" type="button" class="modal-save-button">저 장</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- rate-modal end -->

        <!-- header -->
        <%@ include file="../include/header.jsp" %>
        <div id="sub-navigation">
            <ul>
                <!-- 장르 카테고리 -->
                <li><a href="#">GUARDIANS OF THE GALAXY VOL. 3</a></li>
            </ul>
            <div id="search">
                <form action="#" method="get" accept-charset="utf-8">
                    <label for="search-field">SEARCH</label>
                    <input type="text" name="search field" value="Enter search here" id="search-field"
                        class="blink search-field" />
                    <input type="submit" value="GO!" class="search-button" />
                </form>
            </div>
        </div>
    </div>
    <!-- header end -->





    <!-- main -->

    <div id="main" class="main-box">
        <div class="video-box">
            <div class="video-container">
                <c:forEach var="d" items="${detail.movieImgList}">
                    <c:if test="${d.imgName == 'youtube'}">
                        <iframe src="${d.imgUrl}" frameborder="0" allowfullscreen></iframe>
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <div class="detail-post-rank-box">
            <div class="detail-post">
                <c:forEach var="d" items="${detail.movieImgList}">
                    <c:if test="${d.imgName == 'poster'}">
                        <img src="${d.imgUrl}" alt="#">
                    </c:if>
                </c:forEach>

            </div>
            <div class="detail-rank">
                <div class="rank-box-title">
                    <h2>${detail.title}</h2>
                    <!-- <p>run time ${detail.runtime}</p> -->
                </div>
                <div class="rank-box-ranks">
                    <div class="rank">
                        <img src="/assets/img/apple.png" alt="#">
                        <h3>사소한 평가</h3>
                    </div>
                    <div class="rank-num-box">
                        <p>${detail.score}</p>
                    </div>
                    <div class="like">
                        <img src="/assets/img/like-httpswww.flaticon.com.png" alt="#">
                        <h3>LIKE</h3>
                    </div>
                    <div class="like-num-box">
                        <p>158♥</p>
                    </div>
                </div>
            </div>
        </div>




        <div class="movie-detail-box">
            <div class="movie-detail-subname">
                <p><span>│</span> MOVIE INFO</p>
            </div>
            <div><span>${detail.info}</span>
            </div>
            <div>
                <p>관람가: <span>${detail.age}</span></p>
            </div>
            <div>
                <p>장르: <span>${detail.genre}</span></p>
            </div>
            <div>
                <p>감독: <span>${detail.director}</span></p>
            </div>
            <div>
                <p>런타임: <span>${detail.runtime}</span></p>
            </div>


        </div>

        <div class="detail-rate-modal-button">
            <button id="openModal">사소한평가 남기기</button>
        </div>

        <div class="movie-detail-ranks-box">
            <div class="movie-detail-subname">
                <p><span>│</span> CRITIC REVIEWS FOR GUARDIANS OF THE GALAXY VOL. 3</p>
            </div>
            <div class="movie-detail-main-rank" id="rate-box">
                <!-- 평가 목록 생성 -->

            </div>
        </div>

    </div>
    </div>
    <!--  MAIN END  -->
    </div>
    <!-- END PAGE SOURCE -->


    <script>
        var $modal = document.getElementById("myModal");
        var $btn = document.getElementById("openModal");
        var $span = document.getElementsByClassName("close")[0];

        $btn.onclick = e => {
            $modal.style.display = "block";

        }

        $span.onclick = e => {
            $modal.style.display = "none";
        }

        const URL = '/rates';

        const mNum = '${detail.movieNum}';
        console.log(mNum);


        const ratingInputs = document.querySelectorAll('.rating input');
        let selectedRating = null;

        ratingInputs.forEach(input => {
            input.addEventListener('change', function () {
                selectedRating = this.value;
                console.log(selectedRating);
            });
        });


        // 평가 목록 가져오기
        function getRateList(page = 1) {

            // @GetMapping("/{type}/contents/{target}/page/{page}")
            fetch(`\${URL}/movies/contents/\${mNum}/page/\${page}`)
                .then(res => res.json())
                .then(result => {
                    console.log(result);
                    renderRateList(result);
                });
        }


        function renderRateList({
            count,
            pageInfo,
            rates
        }) {
            let tag = '';

            // count 미사용

            if (rates === null || rates.length === 0) {
                tag += "<div class='speech-bubble'>" +
                    "<div class='movie-detail-icon-text-box'>" +
                    "<div class='movie-detail-rate-icon'>" +
                    "<img src='/assets/img/apple.png' alt=''>" +
                    "</div>" +
                    "<div class='movie-detail-rate-text'>" +
                    "<span>" +
                    "<b> 첫 평가를 남겨주세요! </b>" +
                    "</span>" +
                    "</div>" +
                    "</div>" +
                    "</div>";
            } else {
                var i = 0;
                for (let rate of rates) {
                    const {
                        rateNum,
                        userNum,
                        movieNum,
                        rateReview,
                        rateScore,
                        rateDate,
                        userId
                    } = rate;
                    // console.log(i++);



                    tag += `<div class="movie-detail-rate-containier" >
                                <div class="movie-detail-rate-containier" data-rn="\${rateNum}">
                                    <div class="speech-bubble">
                                        <div class="movie-detail-icon-text-box">
                                            <div class="movie-detail-rate-icon">
                                                <img src="/assets/img/apple.png" alt=""> 
                                            </div>
                                        </div>
                                        <div class="movie-detail-rate-text">
                                            <span> 
                                                \${rateReview}
                                            </span>
                                        </div>                                    
                                        <div class="movie-detail-rate-time-like-box">
                                            <div class="movie-detail-rate-time-box">
                                                <p>
                                                    <span> \${rateDate}</span> |<span> Rating: \${rateScore}5</span>
                                                </p>
                                            </div>                                    
                                            <div class="movie-detail-rate-like-box">
                                                <img src="/assets/img/star.png" alt=""> 
                                            </div>                                    
                                        </div>
                                    </div>
                                    <div class="movie-detail-rate-writer">
                                        <div class="writer-name-score-box">
                                            <div class="writer-name">
                                                <span>
                                                    \${userId} 
                                                </span>
                                            </div>
                                            <div class="writer-score">
                                                <span>
                                                    324 
                                                </span>
                                            </div>
                                        </div>                             
                                    </div>
                                </div>
                            </div>`;

                }
            }

            document.getElementById('rate-box').innerHTML = tag;

            // 페이지 렌더링 해야되나...
        }


        // 모달창을 열때 fetch에 userNum, movieNum 담아서 보낸 후
        // 평가를 남겼었는지 판단해서 조건으로 처리 해야함
        // const addURL = "/" + "유저넘(세션)" + "/" + mNum;
        // fetch(URL + addURL)  사용하면 될듯?

        // 임시: 얘는 모달창이 열린곳에서 포스트가 넘어가는 기능임 
        function ratePostButton() {
            const $postBtn = document.getElementById('modal-save');
            const userid = 'test2';
            $postBtn.onclick = e => {
                const $review = document.getElementById('modal-content');
                // const $score = 

                const payload = {
                    // userNum => 세션 dto에서 가져와야되고                
                    userNum: 5,
                    movieNum: mNum,
                    // 입력값 받아오고
                    rateReview: 'asd',
                    // 입력 점수 받아오고
                    rateScore: 9,
                    // 세션에서 받아와야됨
                    userId: userid
                };

                const requestInfo = {
                    method: 'POST',
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify(payload)
                };

                fetch(`\${URL}/post`, requestInfo)
                    .then(res => {
                        if (res.status === 200) {
                            alert('평가가 정상적으로 등록되었습니다.');
                            // 등록 모달 닫기
                            window.addEventListener('click', e => {
                                // 모달 디스플레이 none 처리 등

                                // 평가 리스트 출력
                                getRateList();
                            });
                            // $rw.value = '';
                        } else {
                            alert('댓글 등록에 실패함!');
                        }
                    });

            }
        }

        const stars = document.querySelectorAll('.rating input[type="radio"]');
        stars.forEach((star) => {
            star.addEventListener('click', (event) => {
                const selectedRating = event.target.value;
                fillStars(selectedRating);
            });
        });

        // 선택된 별점 이하의 별을 채웁니다.
        function fillStars(selectedRating) {
            const starsContainer = document.querySelector('.rating');
            const starElements = starsContainer.querySelectorAll('.star');
            starElements.forEach((star, index) => {
                if (index < selectedRating) {
                    star.classList.add('filled');
                } else {
                    star.classList.remove('filled');
                }
            });
        }

        (function () {
            getRateList();

            ratePostButton();
        })();
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- footer -->
    <%@ include file="../include/footer.jsp" %>
    <!-- footer end-->


</body>

</html>