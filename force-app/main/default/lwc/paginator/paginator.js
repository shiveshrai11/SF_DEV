import { LightningElement } from 'lwc';

export default class Paginator extends LightningElement {
    handlePrevious() {
        this.dispatchEvent(new CustomEvent('previous'));
    }

    handleNext() {
        console.log('next');
        this.dispatchEvent(new CustomEvent('next'));
    }
}