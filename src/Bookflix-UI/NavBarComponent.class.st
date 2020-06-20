Class {
	#name : #NavBarComponent,
	#superclass : #WAComponent,
	#instVars : [
		'contentComponent'
	],
	#category : #'Bookflix-UI-navbars'
}

{ #category : #construction }
NavBarComponent class >> withContentComponent: aComponent [
	^ self new withContentComponent: aComponent
]

{ #category : #callbacks }
NavBarComponent >> goToHome [
	contentComponent home
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

{ #category : #initialization }
NavBarComponent >> withContentComponent: aComponent [
	contentComponent := aComponent
]
