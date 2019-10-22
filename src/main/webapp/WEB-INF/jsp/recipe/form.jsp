<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/form.css">
<title>레시피 등록폼</title>
</head>
<body>


<div id="app">
        <div>
            <div class="wrapper">
                <main class="site-main">
                    <div class="container">
                        <div class="block-gird-item">
                            <div>
                                <form name="frmRecipe"><input type="hidden" name="user_id" value="1">
                                    <div class="toobar"><strong class="title pull-left">레시피 등록 </strong><button class="btn btn-default pull-right">등록</button></div>
                                    <div class="block-write">
                                        <div class="block-content">
                                            <div class="row form-group">
                                                <div class="col-xs-2"><label class="label">제목</label></div>
                                                <div class="col-xs-10"><input type="text" name="title" required="" class="form-control" placeholder="레시피 제목을 입력해주세요" value=""></div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-xs-2"><label class="label">간단설명</label></div>
                                                <div class="col-xs-10"><textarea name="desc" required="" class="form-control" placeholder="100자 내외의 간단한 레시피 설명을 입력해주세요"></textarea></div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-xs-2"><label class="label">분류</label></div>
                                                <div class="col-xs-10"><select class="form-control" name="cate" required="">
                                                        <option value="1">분류</option>
                                                        <option value="3">멍키친</option>
                                                        <option value="20">냥키친</option>
                                                    </select></div>
                                            </div>
                                        </div>
                                        <div class="block-title"><span class="title">레시피정보 설정</span></div>
                                        <div id="block_1" class="block-content">
                                            <div class="row form-group">
                                                <div class="col-xs-2"><label class="label">동물 크기</label></div>
                                                <div class="col-xs-4"><select class="form-control" name="size" required="">
                                                        <option value="27">소형</option>
                                                        <option value="28">중형</option>
                                                        <option value="29">대형</option>
                                                    </select></div>
                                                <div class="col-xs-2"><label class="label">동물 나이</label></div>
                                                <div class="col-xs-4"><select class="form-control" name="age" required="">
                                                        <option value="31">어림</option>
                                                        <option value="32">성견/성묘</option>
                                                        <option value="33">노령</option>
                                                    </select></div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-xs-2"><label class="label">건조 정도</label></div>
                                                <div class="col-xs-4"><select class="form-control" name="dryness" required="">
                                                        <option value="35">습식</option>
                                                        <option value="36">건조</option>
                                                    </select></div>
                                                <div class="col-xs-2"><label class="label">주요 기능</label></div>
                                                <div class="col-xs-4"><select class="form-control" name="function" required="">
                                                        <option value="38">모질개선</option>
                                                        <option value="39">다이어트</option>
                                                        <option value="40">구강개선</option>
                                                        <option value="41">신장관련</option>
                                                        <option value="42">관절관련</option>
                                                        <option value="43">장관련</option>
                                                    </select></div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col-xs-2"><label class="label">태그</label></div>
                                                <div class="col-xs-10"><input type="text" name="tags" class="form-control" placeholder="1개 이상의 정보는 #로 구분해주세요." value=""></div>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-xs-2"><label class="label">준비 시간</label></div>
                                            <div class="col-xs-10"><select class="form-control" name="prepare_time" required="">
                                                    <option value="45">10분 이내</option>
                                                    <option value="46">20분 이내</option>
                                                    <option value="47">30분 이내</option>
                                                    <option value="48">60분 이내</option>
                                                    <option value="49">90분 이내</option>
                                                    <option value="50">2시간 이상</option>
                                                </select></div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-xs-2"><label class="label">조리 시간</label></div>
                                            <div class="col-xs-10"><select class="form-control" name="cooking_time" required="">
                                                    <option value="52">10분 이내</option>
                                                    <option value="53">20분 이내</option>
                                                    <option value="54">30분 이내</option>
                                                    <option value="55">60분 이내</option>
                                                    <option value="56">90분 이내</option>
                                                    <option value="57">2시간 이상</option>
                                                </select></div>
                                        </div>
                                        <div class="block-title"><span class="title">재료 정보</span></div>
                                        <div id="block_3" class="block-content">
                                            <div class="row form-group">
                                                <div class="col-xs-12 text-right"><button class="btn btn-default btn-sm" type="button">추가입력</button></div>
                                            </div>
                                            <div class="group-flex">
                                                <div class="form-group"><label class="label">재료 1</label><input type="text" name="name" class="form-control" value=""></div>
                                                <div class="form-group"><label class="label">용량 1</label><input type="text" name="quantity" class="form-control" value=""></div>
                                                <div class="form-group" style="display: none;">
                                                    <div class="btn btn-outline" id="material-preview-0" style="min-width: 50px; width: 50px; padding: 0px;">
                                                        <div style="height: 48px; width: 48px; border-radius: 5px; display: block; background-position: center center; background-repeat: no-repeat; background-size: cover; background-image: url(&quot;undefined&quot;);"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group"><button class="btn btn-outline btn-sm" type="button">삭제</button></div>
                                            </div>
                                        </div>
                                        <div class="step-list">
                                            <div>
                                                <div class="block-title _gray"><span class="title">STEP 1</span></div>
                                                <div class="block-content">
                                                    <div class="row form-group">
                                                        <div class="col-xs-12 text-right"><a class="btn btn-outline btn-camera" style="display: none;"><input class="btn btn-outline btn-camera" type="file" id="ip-1" style="width: 100%; height: 100%; opacity: 0; overflow: hidden;"></a><a class="btn btn-outline btn-images"><input class="btn btn-outline btn-images" type="file" id="ip-1" style="width: 100%; height: 100%; opacity: 0; overflow: hidden;"></a><a class="btn btn-outline btn-video" style="display: none;"><input class="btn btn-outline btn-video" type="file" id="ip-1" style="width: 100%; height: 100%; opacity: 0; overflow: hidden;"></a></div>
                                                    </div>
                                                    <div class="box-photo">
                                                        <div class="photo">
                                                            <div class="img"></div><button class="btn btn-outline btn-block btn-sm" type="button">사진 삭제</button>
                                                        </div>
                                                        <div class="des"><textarea class="form-control" name="contents"></textarea></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="block-content">
                                            <div class="row form-group">
                                                <div class="col-xs-12"><button class="btn btn-default btn-block">+ 순서 추가</button></div>
                                            </div>
                                        </div>
                                        <div class="block-title _gray"><span class="title">요리 완성</span></div>
                                        <div class="block-content">
                                            <div>
                                                <ul class="add-photo">
                                                    <li>
                                                        <div class="photo">
                                                            <div class="img"></div><button class="btn btn-default btn-block" type="button">대표 사진</button><button class="btn btn-default btn-block" style="display: none;">대표 이미지</button>
                                                        </div><button class="btn btn-outline btn-block">사진 삭제</button>
                                                    </li>
                                                    <li>
                                                        <div class="photo">
                                                            <div class="img"></div><button class="btn btn-default btn-block" style="display: none;">대표 이미지</button>
                                                        </div><button class="btn btn-outline btn-block">사진 삭제</button>
                                                    </li>
                                                    <li>
                                                        <div class="photo">
                                                            <div class="img"></div><button class="btn btn-default btn-block" style="display: none;">대표 이미지</button>
                                                        </div><button class="btn btn-outline btn-block">사진 삭제</button>
                                                    </li>
                                                    <li>
                                                        <div class="photo">
                                                            <div class="img"></div><button class="btn btn-default btn-block" style="display: none;">대표 이미지</button>
                                                        </div><button class="btn btn-outline btn-block">사진 삭제</button>
                                                    </li>
                                                    <li>
                                                        <div class="photo">
                                                            <div class="img"></div><button class="btn btn-default btn-block" style="display: none;">대표 이미지</button>
                                                        </div><button class="btn btn-outline btn-block">사진 삭제</button>
                                                    </li>
                                                </ul>
                                            </div><br><br>
                                            <div class="row form-group">
                                                <div class="col-xs-12 text-center"><button class="btn btn-default" style="height: auto;">등록</button></div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>



<div id='content'>
<h1>레시피 등록폼</h1>
<form action='add' method='post' enctype='multipart/form-data'>
  회원번호: <input type='text' name='memberNo'><br>
  제목: <input type='text' name='title'><br>
  내용: <textarea name='content' rows='5' cols='50'></textarea><br>
  대표사진: <input type='file' name='filePath'><br>
  카테고리: <input type='text' name='category'><br>
  재료: <input type='text' name='ingredientNames'> 용량<input type='text' name='quantity'><br>
  순서: <input type='text' name='processNo'>
  사진: <input type='file' name='filePath2'><br>
  내용: <input type='text' name='cookingContent'><br>
  태그: <input type='text' name='tag'><br>
  기타정보: <textarea name='otherInfo' rows='3' cols='50'></textarea><br>
 <button>등록</button> 
</form>
</div>


</body>
</html>