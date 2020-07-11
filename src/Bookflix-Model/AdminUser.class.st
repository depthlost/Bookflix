Class {
	#name : #AdminUser,
	#superclass : #User,
	#category : #'Bookflix-Model'
}

{ #category : #testing }
AdminUser >> canAddProfile [
	^ false
]

{ #category : #testing }
AdminUser >> canNotPremium [
	^ profiles size <= 3
]

{ #category : #abstract }
AdminUser >> isAdmin [
	^ true
]
