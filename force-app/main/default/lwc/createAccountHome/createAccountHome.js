import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateAccountHome extends LightningElement {


    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Operação Concluida!',
            message: 'Conta criada com sucesso!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);

        let inputFields = this.template.querySelectorAll('lightning-input-field');
        inputFields.forEach(field => {
            field.reset();
        });
    }
}