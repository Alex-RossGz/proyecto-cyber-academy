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
export default {
    data() {
        return {
            phones: [''],
        };
    },
    methods: {
        addPhone() {
            this.phones.push('');
        },
        removePhone(index) {
            this.phones.splice(index, 1);
        },
        submitForm() {
            console.log('Números telefónicos:', this.phones);
            // if one of the phones is invalid, the form won't be submitted
            if (this.phones.some((phone) => !this.isValidPhone(phone))) {
                console.log('Formulario no válido');
                return;
            }
            console.log('Formulario válido');
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
};
</script>
