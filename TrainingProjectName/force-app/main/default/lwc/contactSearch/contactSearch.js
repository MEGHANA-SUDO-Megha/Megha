import { LightningElement, track, wire } from 'lwc';
import searchcontact from '@salesforce/apex/contactController.searchcontact';

export default class contactSearch extends LightningElement {
    @track searchTerm = '';
    @track searchResults = [];

    handleSearchChange(Event) {
        this.searchTerm = Event.target.value;
    }

    handleSearch() {
        searchcontact({ searchTerm: this.searchTerm })
            .then(result => {
                this.searchResults = result;
                console.log('Inside then block');
            })
            .catch(error => {
                console.log('Exception Is : ', error.getMessage);
            });
    }
}