Class {
	#name : #AdminNavBarComponent,
	#superclass : #UserNavBarComponent,
	#category : #'Bookflix-UI'
}

{ #category : #rendering }
AdminNavBarComponent >> renderItemUserDropdownOn: html [
	self
		renderDropdownItem: 'Perfil'
			withCallback: [ self goToUserProfile ]
			on: html;
		renderDropdownDividerOn: html;
		renderDropdownItem: 'Administración' withCallback: [  ] on: html;
		renderDropdownItem: 'Cerrar Sesión'
			withCallback: [ self logout ]
			on: html
]
