import { LightningElement, wire, track, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import fileSettingsMethod from '@salesforce/apex/CreateCaseWithFile.fileSettingsMethod';

export default class FileUploadExample extends LightningElement { 
    limit = false;  //variável para o tamanho limite aceitável
    lstDocumentId = [];
    @api myRecordId;
    @track contentDocumentId;
    // @wire (fileSettingsMethod, {lstContentDocument: lstDocument})
    // wiredlstFileSize({error, data}){
    //     if (data) {
    //         this.lstDocument = data;
    //         console.log('data LOG' + data);
    //         console.log('lstDocument LOG' + lstDocument);
    //         console.log('lstFileSize LOG' + lstFileSize);
    //     }else if (error) {
    //         console.log(error);
    //     }
    // }

    get acceptedFormats() {
        // Type of files accepted
        return ['.pdf', '.png', '.jpg', '.zip', '.txt', '.exe', '.xlsx', '.mp4', '.mp3', '.docx', '.doc'];
    }

    handleUploadFinished(event) {
        //Success Message
        
        const uploadedFiles = event.detail.files;
        console.log(':GN:');
        console.log(uploadedFiles);
        let fileDocumentId = [];
        for(let iFileDetails = 0; iFileDetails < uploadedFiles.length; iFileDetails++) {
            fileDocumentId[iFileDetails] += uploadedFiles[iFileDetails].documentId;
        }
        console.log(':GN:');
        console.log(fileDocumentId);

        const show = new ShowToastEvent({
            title: 'Sucesso!',
            message:'O arquivo foi inserido no objeto Files com Sucesso!',
            variant: 'success'
        });
        this.dispatchEvent(show);
    }

    fileSettingsMethod(fileDocumentId){
        console.log(':GN: fileDocumentId');
        console.log(this.fileDocumentId);
    }
}