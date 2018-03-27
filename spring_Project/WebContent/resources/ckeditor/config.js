/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.toolbar =[
        ['Source','-','Cut','Copy','Paste','PasteText','PasteFromWord','Undo','Redo','SelectAll','RemoveFormat'],
        '/',
        ['Bold','Italic','Underline','Strike', 'Subscript','Superscript'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['NumberedList','BulletedList','Outdent','Indent','Blockquote','CreateDiv'],
        ['Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
        ['Styles','Format','Font','FontSize','TextColor','BGColor','Maximize', 'ShowBlocks']
    ];
	config.allowedContent = true;
};
