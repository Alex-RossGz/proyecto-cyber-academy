<template>
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="text-center">
                            <i class="fas fa-phone"></i> Números telefónicos del profesor
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
                            <div v-for="(phone, index) in phones" :key="index" class="mb-4">
                                <div class="form-group">
                                    <label :for="'phone-' + index">Teléfono {{ index + 1 }}</label>
                                    <input type="text" class="form-control" :id="'phone-' + index"
                                        :class="{ 'is-invalid': !isValidPhone(phone) }" v-model="phones[index]"
                                        @input="validatePhone(phone)" />
                                    <div v-if="!isValidPhone(phone)" class="invalid-feedback">
                                        Número telefónico no válido
                                    </div>
                                </div>
                                <button v-if="phones.length > 1" type="button" class="btn btn-danger mt-2"
                                    @click="removePhone(index)">
                                    <i class="fas fa-trash"></i> Eliminar teléfono
                                </button>
                            </div>

                            <div v-if="phones.length < 3">
                                <button type="button" class="btn btn-primary mb-3" @click="addPhone">
                                    <i class="fas fa-plus"></i> Añadir teléfono
                                </button>
                            </div>

                            <button type="submit" class="btn btn-primary">
                                Guardar teléfonos
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            phones: [''],
            success: false,
            error: false,
            message: '',
        };
    },
    methods: {
        addPhone() {
            this.phones.push('');
        },
        removePhone(index) {
            this.phones.splice(index, 1);
        },
        async submitForm() {
            console.log('Números telefónicos:', this.phones);
            // if one of the phones is invalid, the form won't be submitted
            if (this.phones.some((phone) => !this.isValidPhone(phone))) {
                console.log('Formulario no válido');
                return;
            }
            console.log('Formulario válido');

            const response = await axios.patch('update/telefono', {
                phones: this.phones,
            });

            console.log('Response telefono:', response);

            this.success = response.data.success;
            this.error = response.data.error;
            this.message = response.data.message;

            setTimeout(() => {
                this.success = false;
                this.error = false;
                this.message = '';
            }, 5000);
        },
        isValidPhone(phone) {
            const phoneRegex = /^(\d{2,3})[-\s]?(\d{7,8})$/;
            return phoneRegex.test(phone);
        },
        validatePhone(phone) {
            if (!this.isValidPhone(phone)) {
                console.log('Número telefónico no válido');
            } else {
                console.log('Número telefónico válido');
            }
        },

    },
    mounted() {
        axios.get('/get/telefono').then((response) => {
            console.log('Telefonos:', this.phones);
            this.phones = response.data.telefono.map((phone) => phone.telefono);
        });

    },
};
</script>
