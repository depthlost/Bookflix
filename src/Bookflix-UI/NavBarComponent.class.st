Class {
	#name : #NavBarComponent,
	#superclass : #WAComponent,
	#instVars : [
		'rootComponent'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
NavBarComponent class >> rootComponent: aRootComponent [
	^ self new rootComponent: aRootComponent
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
		callback: [  ];
		with: [ html image
				url: 'images/logo.svg';
				height: '24' ]
]

{ #category : #rendering }
NavBarComponent >> renderNavBarContentOn: html [
	self renderLogoOn: html
]

{ #category : #accessing }
NavBarComponent >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]

{ #category : #seaside }
NavBarComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: '/css/navbar.css'
]
