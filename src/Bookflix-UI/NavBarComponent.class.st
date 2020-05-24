Class {
	#name : #NavBarComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parentComponent'
	],
	#category : #'Bookflix-UI-navbars'
}

{ #category : #construction }
NavBarComponent class >> in: aComponent [
	^ self new in: aComponent
]

{ #category : #callbacks }
NavBarComponent >> goToHome [
	parentComponent goToHomeContent
]

{ #category : #initialization }
NavBarComponent >> in: aComponent [
	parentComponent := aComponent
]

{ #category : #rendering }
NavBarComponent >> renderContentOn: html [
	html navigation
		class: 'navbar navbar-expand sticky-top site-header';
		with: [ self renderNavBarContentOn: html ]
]

{ #category : #rendering }
NavBarComponent >> renderLogoOn: html [
	html anchor
		class: 'navbar-brand';
		callback: [ self goToHome ];
		with: [ html image
				url: 'images/logo.svg';
				height: '24' ]
]

{ #category : #rendering }
NavBarComponent >> renderNavBarContentOn: html [
	self renderLogoOn: html
]

{ #category : #seaside }
NavBarComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: '/css/navbar.css'
]
