<template>
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="text-center">
                            <i class="fas fa-envelope"></i> Correos electrónicos del profesor
                        </h4>
                    </div>
                    <div class="card-body">
                        <div v-if="success" class="alert alert-success alert-dismissible fade show" role="alert">
                            <strong>¡Éxito!</strong> {{ message }}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div v-if="error" class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>¡Error!</strong> {{ message }}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <form @submit.prevent="submitForm">
                            <div v-for="(email, index) in emails" :key="index" class="mb-4">
                                <div class="form-group">
                                    <label :for="'email-' + index">Correo electrónico {{ index + 1 }} {{  index == 0 ? ' (Principal)' : '' }}</label>
                                    <input type="email" class="form-control" :id="'email-' + index"
                                        :class="{ 'is-invalid': !isValidEmail(email) }" v-model="emails[index]"
                                        :disabled="index === 0" @input="validateEmail(email)" />
                                    <div v-if="!isValidEmail(email)" class="invalid-feedback">
                                        Correo electrónico no válido
                                    </div>
                                </div>
                                <button v-if="emails.length > 1" type="button" class="btn btn-danger mt-2"
                                    @click="removeEmail(index)">
                                    <i class="fas fa-trash"></i> Eliminar correo electrónico
                                </button>
                            </div>

                            <div v-if="emails.length < 3">
                                <button type="button" class="btn btn-primary mb-3" @click="addEmail">
                                    <i class="fas fa-plus"></i> Añadir correo electrónico
                                </button>
                            </div>

                            <button type="submit" class="btn btn-primary">
                                Guardar correos electrónicos
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            emails: [''],
            success: false,
            error: false,
            message: '',
        };
    },
    methods: {
        addEmail() {
            this.emails.push('');
        },
        removeEmail(index) {
            this.emails.splice(index, 1);
        },
        async submitForm() {
            console.log('Correos electrónicos:', this.emails);

            const response = await axios.patch('/update/correo', {
                emails: this.emails,
            });

            this.success = response.data.success;
            this.error = response.data.error;
            this.message = response.data.message;

            setTimeout(() => {
                this.success = false;
                this.error = false;
                this.message = '';
            }, 5000);

        },
        isValidEmail(email) {
            const emailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
            return emailRegex.test(email);
        },
        validateEmail(email) {
            if (!this.isValidEmail(email)) {
                console.log('Correo electrónico no válido');
            } else {
                console.log('Correo electrónico válido');
            }
        },
    },
    mounted() {
        axios.get('/get/correo').then((response) => {
            console.log(response);
            this.emails = response.data.correo.map(email => email.correo);
        });
    },
};
</script>
