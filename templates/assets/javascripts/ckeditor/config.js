CKEDITOR.editorConfig = function( config ) {

  config.language = 'zh';
  config.filebrowserBrowseUrl = "/administration/ckeditor/attachment_files";
  config.filebrowserFlashBrowseUrl = "/administration/ckeditor/attachment_files";
  config.filebrowserFlashUploadUrl = "/administration/ckeditor/attachment_files";
  config.filebrowserImageBrowseLinkUrl = "/administration/ckeditor/pictures";
  config.filebrowserImageBrowseUrl = "/administration/ckeditor/pictures";
  config.filebrowserImageUploadUrl = "/administration/ckeditor/pictures";
  config.filebrowserUploadUrl = "/administration/ckeditor/attachment_files";

  config.extraPlugins = 'youtube';
  config.youtube_width = '560';
  config.youtube_height = '315';
  config.youtube_related = false;
  config.youtube_older = false;
  config.youtube_privacy = false;
  // toolbar setting-1 (Pure)
  config.toolbar_Pure = [
    '/', {
      name: 'basicstyles',
      items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
    }, {
      name: 'paragraph',
      items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']
    }, {
      name: 'links',
      items: ['Link', 'Unlink']
    }, '/', {
      name: 'styles',
      items: ['Styles', 'Format', 'Font', 'FontSize']
    }, {
      name: 'colors',
      items: ['TextColor', 'BGColor']
    }, {
      name: 'insert',
      // items: ['Image', 'HorizontalRule', 'PageBreak', 'Youtube']
      items: ['Image', 'HorizontalRule', 'PageBreak','-', 'Youtube']
    }
  ];
  // toolbar setting-2 (Link only)
  config.toolbar_Linkonly = [
    '/', {
      name: 'links',
      items: ['Link', 'Unlink']
    }
  ];

  config.toolbar = 'Pure';
  config.allowedContent = true;
  return true;
};
