	var post_path = "${pageContext.request.contextPath }/community/viewpost?no="
	var pet_image_path = "hotdog/image/user/";
	
		var render1 = function(vo){
				
			var htmls =  "<div class='post-thumbnail-entry'><div class='post-thumbnail-content'>" +
						 "<h4><a href='" + post_path + vo.board_no + "'>" + vo.title + "</a></h4>" +
						 "<span class='post-date'><i class='fa fa-clock-o'></i>" + vo.regdate + "</span>" +
						 "<span class='post-category'><i class='fa fa-eye'></i> 조회수 : " + vo.hits + "</span></div></div>"
						
						
						$(".free_List").append(htmls);
							 
			};
			
		var render2 = function(vo){
				
				var htmls =  "<div class='post-thumbnail-entry'><div class='post-thumbnail-content'>" +
							 "<h4><a href='" + post_path + vo.board_no + "'>" + vo.title + "</a></h4>" +
							 "<span class='post-date'><i class='fa fa-clock-o'></i>" + vo.regdate + "</span>" +
							 "<span class='post-category'><i class='fa fa-eye'></i> 조회수 : " + vo.hits + "</span></div></div>"
							
							
							$(".gallery_list").append(htmls);
								 
				};	
				
		var render3 = function(vo){
					
					var htmls =  "<div class='post-thumbnail-entry'><div class='post-thumbnail-content'>" +
								 "<h4><a href='" + post_path + vo.board_no + "'>" + vo.title + "</a></h4>" +
								 "<span class='post-date'><i class='fa fa-clock-o'></i>" + vo.regdate + "</span>" +
								 "<span class='post-category'><i class='fa fa-eye'></i> 조회수 : " + vo.hits + "</span></div></div>"
								
								
							$(".diary_list").append(htmls);
									 
					};
					
					
		var render_hotdog = function(vo){
						
			
						var htmls =  "<article class='post-entry'><a href='#' class='post-image'><img src='" + pet_image_path + vo.pet_image + "'></a>" +
										"<div class='post-entry-overlay'><div class='post-entry-meta'><div class='post-entry-meta-title'>" +
										"<h1><a href='#'>" + vo.info + "</a></h1></div><div><h3><a href='#' style='color:white'>" + vo.name + " +</a></h3></div></br>" +
										"<span class='post-date'><i class='fa fa-smile-o'></i>" + vo.nickname  +  "&nbsp;&nbsp;</span>"+
								
										"<span class='post-date'><i class='fa fa-intersex'></i> " + vo.gender + "&nbsp;&nbsp;</span>" +
										"<span class='post-date'><i class='fa fa-calendar'></i> " + vo.co_date + "&nbsp;&nbsp;</span>" +
										"<span class='post-date'><i class='fa fa-paw'></i>" + vo.age + "&nbsp;&nbsp;</span>" +
										"<span class='post-date'><i class='fa fa-thumbs-o-up'></i>" + vo.count + "&nbsp;&nbsp;</span>" +
										"</div></div></article>"
									
									
									$(".best_hotdog").append(htmls);
										 
						};




$(function(){
	
		var fetchList1 = function(){
			console.log("fetchList1")
		
			  $.ajax({
				url: "main/api/board_list?category_no=" + 1,
				type: "get",
				dataType: "json",
				data:"",
				success: function(response){
					console.log(response)
					if(response.result != "success"){
						console.error(response.message);
						return;
					}
					
				$(response.data).each(function(index, vo){
					render1(vo);
					console.log("render")
				}); 
			},
			error: function(jqXHR, status, e){
				console.error(status + ":" + e)
			}
		}); 
			
			
		};
		fetchList1();
})
	
	
	$(function(){
		
		var fetchList2 = function(){
			console.log("fetchList2")
		
			  $.ajax({
				url: "main/api/board_list?category_no=" + 2,
				type: "get",
				dataType: "json",
				data:"",
				success: function(response){
					console.log(response)
					if(response.result != "success"){
						console.error(response.message);
						return;
					}
					
				$(response.data).each(function(index, vo){
					render2(vo);
					console.log("render")
				}); 
			},
			error: function(jqXHR, status, e){
				console.error(status + ":" + e)
			}
		}); 
			
			
		};
		fetchList2();
	})

	
	$(function(){
		var fetchList3 = function(){
			console.log("fetchList3")
		
			  $.ajax({
				url: "main/api/board_list?category_no=" + 3,
				type: "get",
				dataType: "json",
				data:"",
				success: function(response){
					console.log(response)
					if(response.result != "success"){
						console.error(response.message);
						return;
					}
					
				$(response.data).each(function(index, vo){
					render3(vo);
					console.log("render")
				}); 
			},
			error: function(jqXHR, status, e){
				console.error(status + ":" + e)
			}
		}); 
			
			
		};
		fetchList3();
	})
	
	
	
	$(function(){
		var HotdogList = function(){
			console.log("HotdogList")
		
			  $.ajax({
				url: "main/api/hotdog_list",
				type: "get",
				dataType: "json",
				data:"",
				success: function(response){
					console.log(response)
					if(response.result != "success"){
						console.error(response.message);
						return;
					}
					
				$(response.data).each(function(index, vo){
					render_hotdog(vo);
					console.log("hotdog render")
				}); 
			},
			error: function(jqXHR, status, e){
				console.error(status + ":" + e)
			}
		}); 
		};
		HotdogList();
	})
	
	
	
	
	
	
	
	
	