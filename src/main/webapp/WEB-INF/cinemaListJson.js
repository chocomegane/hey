/**
 * 映画のリストをとってくるjson
 */

function createHtml(i) {
	var htmlSource = "<br>";
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
	return htmlSource
}

$(function() {

	var contextPath = $("#contextPath").val();

	$.getJSON(contextPath + '/json/exe', function(json) {

		var htmlSource = "";
		for (var i = 0; i < json.length; i++) {

			var numberFormat = /(\d)(?=(\d\d\d)+(?!\d))/g;
			var imagePath = json[i].imagePath;
			var title = json[i].title;
			var director = json[i].directedBy;
			var price = String(json[i].price).replace(numberFormat, '$1,');
			var id = json[i].id;
			htmlSource = createHtml(i);
		}

		htmlSource = '1ページ<br><table class="table table-striped"><tbody><tr>'
				+ htmlSource + '</tr></tbody></table>';

		$("#dvd").append(htmlSource);

	});
});

$(function() {
	var contextPath = $("#contextPath").val();

	$('.pagings')
			.on(
					'click',
					function() {

						var page = $(this).val();
						page = page - 1;

						$
								.getJSON(
										contextPath + '/json/exe/paging?page='
												+ page,
										function(json) {
											var htmlSource = "";
											for (var i = 0; i < json.length; i++) {

												var numberFormat = /(\d)(?=(\d\d\d)+(?!\d))/g;
												var imagePath = json[i].imagePath;
												var title = json[i].title;
												var director = json[i].directedBy;
												var price = String(
														json[i].price).replace(
														numberFormat, '$1,');
												var id = json[i].id;
												htmlSource = createHtml(i);
												
											}

											htmlSource = page
													+ 1
													+ 'ページ<br><table class="table table-striped"><tbody><tr>'
													+ htmlSource
													+ '</tr></tbody></table>';
											$("#dvd").html(htmlSource);

										});
					});

});