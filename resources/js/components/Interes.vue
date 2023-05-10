<template>
    <div class="container my-5" id="interes">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="text-center">
                            <i class="fas fa-star"></i> Intereses de aprendizaje
                        </h4>
                    </div>
                    <div class="card-body">
                        <!-- alert  -->
                        <div v-if="success" class="alert alert-success alert-dismissible fade show" role="alert">
                            <strong>¡Bien hecho!</strong> {{ message }}
                        </div>
                        <div v-if="error" class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>¡Error!</strong> {{ message }}
                        </div>

                        <form @submit.prevent="submitForm">
                            <div v-for="(interest, index) in interests" :key="index" class="mb-4">
                                <div class="form-group">
                                    <label :for="'interest-' + index">Interés {{ index + 1 }}</label>
                                    <input type="text" class="form-control" :id="`interest-${index}`" v-model="interests[index].interes"
                                        placeholder="Interés" />
                                </div>
                                <button type="button" class="btn btn-danger mt-2" @click="removeInterest(index)">
                                    <i class="fas fa-trash"></i> Eliminar interés
                                </button>
                            </div>

                            <div v-if="interests.length < 4">
                                <button type="button" class="btn btn-primary mb-3" @click="addInterest">
                                    <i class="fas fa-plus"></i> Añadir interés
                                </button>
                            </div>
                            <div class="d-flex justify-content-center card-footer">
                                <div class="text-center">
                                    <button type="submit" class="btn btn-success">
                                        <i class="fas fa-save"></i> Guardar intereses
                                    </button>
                                </div>
                            </div>
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
            interests: [''],
            success: false,
            error: false,
            message: '',
        };
    },
    mounted() {
        this.getInterests();
    },
    methods: {
        addInterest() {
            this.interests.push({ interes: '' });
        },
        removeInterest(index) {
            this.interests.splice(index, 1);
        },
        async submitForm() {
            // get all the interests

            const request = await axios.patch('/update/interes', {
                intereses: this.interests,
            });
            console.log('Interests:', this.interests);
            console.log('Request:', request);

            this.success = request.data.success;
            this.error = request.data.error;
            this.message = request.data.message;

            setTimeout(() => {
                this.success = false;
                this.error = false;
                this.message = '';
            }, 3000);

        },

        async getInterests() {
            const request = await axios.get('/get/interes');
            console.log('Request:', request);
            this.interests = request.data.intereses;
        },
    },
};
</script>
