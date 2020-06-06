Class {
	#name : #AdminBookComponent,
	#superclass : #BookComponent,
	#category : #'Bookflix-UI-books'
}

{ #category : #callbacks }
AdminBookComponent >> goToModifyBook [
	parentComponent call: (SetBookComponent with: book)
]

{ #category : #callbacks }
AdminBookComponent >> removeBook [
	book remove.
	parentComponent
		addAlert: (AlertComponent with: 'Se elimino "' , book title , '" con exito')
]

{ #category : #rendering }
AdminBookComponent >> renderBookContentOn: html [
	super renderBookContentOn: html.
	self renderBookFooterOn: html
]

{ #category : #rendering }
AdminBookComponent >> renderBookFooterOn: html [
	html div
		class: 'card-footer text-right';
		with: [ self
				renderModifyButtonOn: html;
				renderRemoveButtonOn: html ]
]

{ #category : #rendering }
AdminBookComponent >> renderModifyButtonOn: html [
	html anchor
		class: 'text-primary';
		callback: [ self goToModifyBook ];
		with: 'Modificar'
]

{ #category : #rendering }
AdminBookComponent >> renderRemoveButtonOn: html [
	html anchor
		class: 'text-danger ml-3';
		attributeAt: 'href' put: '';
		attributeAt: 'data-toggle' put: 'modal';
		attributeAt: 'data-target'
			put: '#remove_book_' , book isbn , '_modal';
		with: 'Borrar'.
	self
		renderRemoveModalWithId: 'remove_book_' , book isbn , '_modal'
		on: html
]

{ #category : #rendering }
AdminBookComponent >> renderRemoveModalWithId: anId on: html [
	html
		html:
			'<div class="modal fade" id="' , anId
				, '" tabindex="-1" role="dialog" aria-labelledby="' , anId
				,
					'_label" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="' , anId , '_label">Borrar "'
				, book title
				,
					'"</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body text-left"><p>¿Seguro que deseas borrar "'
				, book title
				,
					'"?</p></div>
        <div class="modal-footer"><button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>'.
	html anchor
		class: 'btn btn-danger';
		callback: [ self removeBook ];
		with: 'Borrar'.
	html
		html:
			'</div>
      </div>
    </div>
  </div>'
]
