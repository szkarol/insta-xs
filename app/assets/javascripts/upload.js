$(document).on("turbolinks:render ready page:load", function(){
	Dropzone.autoDiscover = false;

	$("#new_photo").dropzone({
		maxFilesize: 1,
		paramName: "photo[image]",
    previewsContainer: false,

    success: function(file, response){
			App.photo.create(response)
		},

		addedfile: function(file){
			$(".dropzone-loader").show();
		},

		complete: function(file){
			$(".dropzone-loader").hide();
		}
	});
});
