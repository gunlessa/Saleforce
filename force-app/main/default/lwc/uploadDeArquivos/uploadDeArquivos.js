import { LightningElement, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import fileSettingsMethod from '@salesforce/apex/createCaseWithFile.fileSettingsMethod';

export default class FileUploadExample extends LightningElement {
    @api myRecordId;
    //@wire (createAssociatedCaseWithFile, {lstContentDocument})
    limit = false;  //variável para o tamanho limite aceitável
    //teste = [];

    get acceptedFormats() {
        // Type of files accepted
        return ['.pdf', '.png', '.jpg', '.zip', '.txt', '.exe', '.xlsx', '.mp4', '.mp3', '.docx', '.doc'];
    }

    handleUploadFinished(event) {
        //Success Message
        const show = new ShowToastEvent({
            title: 'Sucesso!',
            message:'O arquivo foi inserido no objeto Files com Sucesso!',
            variant: 'success'
        });
        this.dispatchEvent(show);
    }

    if (condition) {
        limit = true;
    }

/* fileSettingsMethod(){
        teste: this.fileSizeLimit.lstFileSettings;
        console.log('teste >> :GN: ', teste);
    }*/
}