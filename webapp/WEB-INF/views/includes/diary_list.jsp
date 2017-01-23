<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="banner-bg" id="top">
<div class="diary-container">
  <div class="diary-post-container">
    <span class="diary-published">
      <span class="diary-date">
        Apr 5 ${map.regdate}
      </span>
      <span class="diary-year">
        2014
      </span>
    </span>
    <div class="diary-post">
      <h1>${map.title}타이틀부분</h1>
      <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTcAGcXQYvVIlNvLd7VaGH81fc9Phuytr_BsbYYlqc4aYnoxdF1eA" />

      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris placerat at massa ac semper. Aliquam pharetra placerat magna, ut vestibulum nisi posuere eu. In hac habitasse platea dictumst.</p>
    </div>
  </div>
   <div class="diary-post-container">
    <span class="diary-published">
      <span class="diary-date">
        Apr 5 ${map.regdate}
      </span>
      <span class="diary-year">
        2014
      </span>
    </span>
    <div class="diary-post">
      <h1>${postVo.title}타이틀부분</h1>
      <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTcAGcXQYvVIlNvLd7VaGH81fc9Phuytr_BsbYYlqc4aYnoxdF1eA" />

      <p>${postVo.content }</p>
    </div>
  </div>
   <div class="diary-post-container">
    <span class="diary-published">
      <span class="diary-date">
        Apr 5 ${map.regdate}
      </span>
      <span class="diary-year">
        2014
      </span>
    </span>
    <div class="diary-post">
      <h1>${map.title}타이틀부분</h1>
      <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTcAGcXQYvVIlNvLd7VaGH81fc9Phuytr_BsbYYlqc4aYnoxdF1eA" />

      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris placerat at massa ac semper. Aliquam pharetra placerat magna, ut vestibulum nisi posuere eu. In hac habitasse platea dictumst.</p>
    </div>
  </div>
  
</div>
</div>

