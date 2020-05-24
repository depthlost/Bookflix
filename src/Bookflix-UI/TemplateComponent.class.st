"
| application |
application := WAAdmin register: TemplateComponent asApplicationAt: '/main'.
application sessionClass: UserSession.
"
Class {
	#name : #TemplateComponent,
	#superclass : #WABootstrapComponent,
	#instVars : [
		'contentComponent',
		'navbarComponent'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #update }
TemplateComponent >> addContent: aComponent [
	contentComponent call: aComponent
]

{ #category : #seaside }
TemplateComponent >> children [
	^ Array with: navbarComponent with: contentComponent
]

{ #category : #update }
TemplateComponent >> goToHomeContent [
	contentComponent home
]

{ #category : #initialization }
TemplateComponent >> initialize [
	navbarComponent := ProxyNavBarComponent in: self.
	contentComponent := LoginComponent in: self
]

{ #category : #update }
TemplateComponent >> loadSessionState [
	navbarComponent := ProxyNavBarComponent in: self.
	contentComponent := HomeComponent new
]

{ #category : #rendering }
TemplateComponent >> renderContentOn: html [
	html
		render: navbarComponent;
		render: contentComponent
]
