Class {
	#name : #NavBarComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI'
}

{ #category : #rendering }
NavBarComponent >> renderContentOn: html [
	html navigation
		class: 'navbar navbar-expand sticky-top site-header';
		with: [ self renderNavBarContentOn: html ]
]

{ #category : #rendering }
NavBarComponent >> renderLogoOn: html [
	"	<img src='bookflix_logo/bookflix.svg' height='24'></img>"
html image
				url: 'images/logo.svg'.
	html anchor
		class: 'navbar-brand';
		callback: [  ];
		with: [  ]
]

{ #category : #rendering }
NavBarComponent >> renderNavBarContentOn: html [
	self renderLogoOn: html
]
