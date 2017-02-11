/**
 * 映画のリストをとってくるjson
 */

function createHtml(json, contextPath) {

	var htmlSource = "<br>";
	for (var i = 0; i < json.length; i++) {
		var provisionalHtmlSource = "";

		var numberFormat = /(\d)(?=(\d\d\d)+(?!\d))/g;
		var imagePath = json[i].imagePath;
		var title = json[i].title;
		var director = json[i].directedBy;
		var price = String(json[i].price).replace(numberFormat, '$1,');
		var id = json[i].id;
		if ((i + 1) % 4 == 0 && !i == 0) {
			var cinemaDataTemplate = '<th>'
					+ '<a href="%{CONTEXTPATH}/detail/%{ID}"><img src="%{IMAGEPATH}" class="img-responsive img-rounded" width="100" height="300"></a>'
					+ '<br><a href="%{CONTEXTPATH}/detail/%{ID}">%{TITLE}</a><br><br>%{DIRECTOR}<br><br>%{PRICE}</th>'
					+ '</tr><tr>'
			provisionalHtmlSource = cinemaDataTemplate.replace(/%{ID}/g, id)
					.replace(/%{CONTEXTPATH}/g, contextPath).replace(
							/%{IMAGEPATH}/g, imagePath).replace(/%{DIRECTOR}/g,
							director).replace(/%{TITLE}/g, title).replace(
							/%{PRICE}/g, price)

		} else {
			var cinemaDataTemplate = '<th>'
					+ '<a href="%{CONTEXTPATH}/detail/%{ID}"><img src="%{IMAGEPATH}" class="img-responsive img-rounded" width="100" height="300"></a>'
					+ '<br><a href="%{CONTEXTPATH}/detail/%{ID}">%{TITLE}</a><br><br>%{DIRECTOR}<br><br>%{PRICE}円</th>'

			provisionalHtmlSource = cinemaDataTemplate.replace(/%{ID}/g, id)
					.replace(/%{CONTEXTPATH}/g, contextPath).replace(
							/%{IMAGEPATH}/g, imagePath).replace(/%{DIRECTOR}/g,
							director).replace(/%{TITLE}/g, title).replace(
							/%{PRICE}/g, price)

		}
	
	htmlSource = htmlSource + provisionalHtmlSource;
	}
	return htmlSource
}

$(function() {

	var contextPath = $("#contextPath").val();

	$.getJSON(contextPath + '/json/exe', function(json) {

		var htmlSource = "";

		htmlSource = createHtml(json, contextPath);

		htmlSource = '1ページ<br><table class="table table-striped"><tbody><tr>'
				+ htmlSource + '</tr></tbody></table>';

		$("#dvd").append(htmlSource);

	});
});


$(function() {
	var contextPath = $("#contextPath").val();

	$('.search')
			.on('click',
					function() {

						var searchNum = $(this).val();
						
						searchNum = searchNum - 1;

						$.getJSON(
										contextPath + '/json/exe/search?searchNum='
												+ searchNum +'search=' + search,
										function(json) {
											var htmlSource = "";

											htmlSource = htmlSource
													+ createHtml(json);

											htmlSource = page
													+ 1
													+ 'ページ<br><table class="table table-striped"><tbody><tr>'
													+ htmlSource
													+ '</tr></tbody></table>';
											$("#dvd").html(htmlSource);

										});

					});

});
$(function() {
	var contextPath = $("#contextPath").val();

	$('.pagings')
			.on('click',function() {
						var page = $(this).val();
						page = page - 1;
						$.getJSON(
										contextPath + '/json/exe/paging?page='
												+ page,
										function(json) {
											var htmlSource = "";

											htmlSource = htmlSource
													+ createHtml(json);

											htmlSource = page
													+ 1
													+ 'ページ<br><table class="table table-striped"><tbody><tr>'
													+ htmlSource
													+ '</tr></tbody></table>';
											$("#dvd").html(htmlSource);

										});

					});

});
//////////////////////////////検索結果のjson
$('#searchCinemaPrice')
.change(function() {
	var contextPath = $("#contextPath").val();
			var price = $(this).val();
			$.getJSON(
							contextPath + '/json/exe/searchCinemaPrice?price='
									+ price,
							function(json) {
								
								var htmlSource = "";

								htmlSource = htmlSource
										+ createHtml(json, contextPath);

								htmlSource = page
										+ 1
										+ 'ページ<br><table class="table table-striped"><tbody><tr>'
										+ htmlSource
										+ '</tr></tbody></table>';
								$("#dvd").html(htmlSource);

							});

		});





