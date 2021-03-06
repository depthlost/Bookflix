Class {
	#name : #BootstrapLibrary,
	#superclass : #Object,
	#category : #'Bookflix-UI-libraries'
}

{ #category : #seaside }
BootstrapLibrary class >> add: anHtmlRoot [
	self
		addMetaViewport: anHtmlRoot;
		addCSSBootstrap: anHtmlRoot;
		addJavascriptJquery: anHtmlRoot;
		addJavascriptPopper: anHtmlRoot;
		addJavascriptBootstrap: anHtmlRoot
]

{ #category : #adding }
BootstrapLibrary class >> addCSSBootstrap: anHtmlRoot [
	anHtmlRoot stylesheet
		url:
			'https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css';
		anonymousSubResourceIntegrity:
			'sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh'
]

{ #category : #adding }
BootstrapLibrary class >> addJavascriptBootstrap: anHtmlRoot [
	anHtmlRoot javascript
		url:
			'https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js';
		anonymousSubResourceIntegrity:
			'sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6'
]

{ #category : #adding }
BootstrapLibrary class >> addJavascriptJquery: anHtmlRoot [
	anHtmlRoot javascript
		url: 'https://code.jquery.com/jquery-3.4.1.slim.min.js';
		anonymousSubResourceIntegrity:
			'sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n'
]

{ #category : #adding }
BootstrapLibrary class >> addJavascriptPopper: anHtmlRoot [
	anHtmlRoot javascript
		url: 'https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js';
		anonymousSubResourceIntegrity:
			'sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo'
]

{ #category : #adding }
BootstrapLibrary class >> addMetaViewport: anHtmlRoot [
	anHtmlRoot meta
		name: 'viewport';
		content: 'width=device-width, initial-scale=1, shrink-to-fit=no'
]
