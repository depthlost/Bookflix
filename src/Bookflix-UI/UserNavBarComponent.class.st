Class {
	#name : #UserNavBarComponent,
	#superclass : #NavBarComponent,
	#category : #'Bookflix-UI-navbars'
}

{ #category : #callbacks }
UserNavBarComponent >> logout [
	self session unregister.
	self redirectUrl
]

{ #category : #private }
UserNavBarComponent >> redirectUrl [
	^ self requestContext responseGenerator
		redirectTo: self application url;
		respond
]

{ #category : #rendering }
UserNavBarComponent >> renderDropdownDividerOn: html [
	html div class: 'dropdown-divider'
]

{ #category : #rendering }
UserNavBarComponent >> renderDropdownItem: aTitle withCallback: aCallback on: html [
	html anchor
		class: 'dropdown-item';
		callback: aCallback;
		with: aTitle
]

{ #category : #rendering }
UserNavBarComponent >> renderLeftMenuOn: html [
	html unorderedList class: 'navbar-nav mr-auto'
]

{ #category : #rendering }
UserNavBarComponent >> renderNavBarContentOn: html [
	self renderLogoOn: html.
	html div
		class: 'collapse navbar-collapse';
		with: [ self
				renderLeftMenuOn: html;
				renderRightMenuOn: html ]
]

{ #category : #rendering }
UserNavBarComponent >> renderRightMenuOn: html [
	html unorderedList
		class: 'navbar-nav mr-4';
		with: [ self renderUserLinkOn: html ]
]

{ #category : #rendering }
UserNavBarComponent >> renderUserDropdownOn: html [
	html div
		class: 'dropdown-menu site-header-dropdown my-2';
		attributeAt: 'aria-labelledby' put: 'navbar_user_dropdown';
		with: [ self renderUserItemsOn: html ]
]

{ #category : #rendering }
UserNavBarComponent >> renderUserItemsOn: html [
	self
		renderUserTopItemsOn: html;
		renderDropdownDividerOn: html;
		renderDropdownItem: 'Cerrar Sesión'
			withCallback: [ self logout ]
			on: html
]

{ #category : #rendering }
UserNavBarComponent >> renderUserLinkOn: html [
	html listItem
		class: 'nav-item dropdown';
		with: [ html anchor
				class: 'nav-link dropdown-toggle';
				callback: [  ];
				id: 'navbar_user_dropdown';
				attributeAt: 'role' put: 'button';
				attributeAt: 'data-toggle' put: 'dropdown';
				attributeAt: 'aria-haspopup' put: 'true';
				attributeAt: 'aria-expanded' put: 'false';
				with: self session user name , ' ' , self session user surname.
			self renderUserDropdownOn: html ]
]

{ #category : #rendering }
UserNavBarComponent >> renderUserTopItemsOn: html [
	self
		renderDropdownItem: 'Perfil'
		withCallback: [ contentComponent call: ProxyUserProfileComponent new ]
		on: html
]
