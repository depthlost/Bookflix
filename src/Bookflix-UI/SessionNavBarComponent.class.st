Class {
	#name : #SessionNavBarComponent,
	#superclass : #NavBarComponent,
	#category : #'Bookflix-UI-navbars'
}

{ #category : #getting }
SessionNavBarComponent >> nickname [
	self subclassResponsibility
]

{ #category : #rendering }
SessionNavBarComponent >> renderDropdownDividerOn: html [
	html div class: 'dropdown-divider'
]

{ #category : #rendering }
SessionNavBarComponent >> renderDropdownItem: aTitle withCallback: aCallback on: html [
	html anchor
		class: 'dropdown-item';
		callback: aCallback;
		with: aTitle
]

{ #category : #rendering }
SessionNavBarComponent >> renderLeftMenuOn: html [
	html unorderedList class: 'navbar-nav mr-auto'
]

{ #category : #rendering }
SessionNavBarComponent >> renderNavBarContentOn: html [
	self renderLogoOn: html.
	html div
		class: 'collapse navbar-collapse';
		with: [ self
				renderLeftMenuOn: html;
				renderRightMenuOn: html ]
]

{ #category : #rendering }
SessionNavBarComponent >> renderRightMenuOn: html [
	html unorderedList
		class: 'navbar-nav';
		with: [ self renderUserLinkOn: html ]
]

{ #category : #rendering }
SessionNavBarComponent >> renderUserDropdownOn: html [
	html div
		class: 'dropdown-menu dropdown-menu-right site-header-dropdown my-2';
		attributeAt: 'aria-labelledby' put: 'navbar_user_dropdown';
		with: [ self renderUserItemsOn: html ]
]

{ #category : #rendering }
SessionNavBarComponent >> renderUserItemsOn: html [
	self
		renderUserTopItemsOn: html;
		renderDropdownDividerOn: html;
		renderDropdownItem: 'Cerrar Sesión'
			withCallback: [ self session logout ]
			on: html
]

{ #category : #rendering }
SessionNavBarComponent >> renderUserLinkOn: html [
	html listItem
		class: 'nav-item dropdown';
		with: [ html anchor
				class: 'nav-link dropdown-toggle mr-1';
				callback: [  ];
				id: 'navbar_user_dropdown';
				attributeAt: 'role' put: 'button';
				attributeAt: 'data-toggle' put: 'dropdown';
				attributeAt: 'aria-haspopup' put: 'true';
				attributeAt: 'aria-expanded' put: 'false';
				with: self nickname.
			self renderUserDropdownOn: html ]
]

{ #category : #rendering }
SessionNavBarComponent >> renderUserTopItemsOn: html [
	self
		renderDropdownItem: 'Cuenta'
			withCallback: [ self session mainComponent content
				call: UserAccountComponentProxy new ]
			on: html;
		renderDropdownItem: 'Historial de Lectura'
			withCallback: [ self session mainComponent content call: BooksHistoryComponent new ]
			on: html
]
