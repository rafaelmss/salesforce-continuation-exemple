import { LightningElement, api } from 'lwc';
import fetchData from '@salesforce/apex/IntegrationController.fetchData'
import fetchAsyncData from '@salesforce/apexContinuation/IntegrationController.fetchAsyncData'

export default class Integration extends LightningElement {
    /* eslint-disable no-console */
    // eslint-disable-next-line no-console

    @api title
    @api iconName
    @api method
    @api endpoint
    starttime = "Loading"
    timestamp = "Loading"
    data = "Loading"

    get isExecuted(){
        if(this.starttime == "Loading"){
            return false
        } else {
            return true
        }
    }

    handleClick(){
        this.getData()
    }

    handleAsyncClick(){
        this.getAsyncData()
    }

    getData() {
        this.resetInformation()
        fetchData({
            method: this.method,
            endpoint: this.endpoint
        })
            .then((response) => {
                const datetime = new Date()
                this.timestamp = datetime.toLocaleTimeString()
                this.data = response             
            })
            .catch((_err) => {
                console.log(_err)
            })
    }

    getAsyncData() {
        this.resetInformation()
        fetchAsyncData({
            method: this.method,
            endpoint: this.endpoint
        })
            .then((response) => {
                const datetime = new Date()
                this.timestamp = datetime.toLocaleTimeString()
                this.data = response             
            })
            .catch((_err) => {
                console.log(_err)
            })
    }

    resetInformation() {
        const datetime = new Date()
        this.starttime = datetime.toLocaleTimeString()

        this.timestamp = "Loading"
        this.data = "Loading"
    }
}