import { LightningElement } from 'lwc';

export default class EventSimple extends LightningElement {
    pointerValue = 1;

    handlePrevious() {
        if(this.pointerValue > 1){
            this.pointerValue = this.pointerValue - 1;
        }
    }

    handleNext(){
        this.pointerValue = this.pointerValue + 1;
    }
}