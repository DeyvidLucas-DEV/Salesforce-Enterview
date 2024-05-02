import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountUpdateEmail extends LightningElement {
    @api recordId;

    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Operação Concluida!',
            message: 'Email alterado!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }
}