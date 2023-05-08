<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <h2 class="my-4 text-center text-primary">Lista de tu experiencia</h2>
                <form @submit.prevent="submitForm">
                    <div v-for="(experience, index) in experiences" :key="index" class="my-3">
                        <div class="card">
                            <div class="card-header bg-primary text-white">
                                <h5 class="card-title d-flex align-items-center">
                                    <i class="fas fa-chalkboard-teacher mr-2"></i>
                                    Experiencia {{ index + 1 }}
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="experience">Experiencia</label>
                                        <input type="text" class="form-control" v-model="experience.experience"
                                            placeholder="Experiencia" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="initialDate">Fecha inicial</label>
                                        <input type="date" class="form-control" v-model="experience.initialDate" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="finalDate">Fecha final</label>
                                        <input type="date" class="form-control" v-model="experience.finalDate" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="description">Descripción</label>
                                    <textarea class="form-control" v-model="experience.description" rows="3"
                                        placeholder="Descripción"></textarea>
                                </div>
                                <button v-if="experiences.length > 1" type="button" class="btn btn-danger mt-2"
                                    @click="removeExperience(index)">
                                    <i class="fas fa-trash"></i> Eliminar experiencia
                                </button>

                            </div>
                        </div>
                    </div>
                    <div class="text-center my-4">
                        <button v-if="experiences.length < 5" type="button" class="btn btn-primary" @click="addExperience">
                            <i class="fas fa-plus"></i> Añadir experiencia
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            experiences: [
                {
                    experience: "",
                    initialDate: "",
                    finalDate: "",
                    description: "",
                },
            ],
        };
    },
    methods: {
        addExperience() {
            if (this.experiences.length < 5) {
                this.experiences.push({
                    experience: "",
                    initialDate: "",
                    finalDate: "",
                    description: "",
                });
            }
        },
        removeExperience(index) {
            this.experiences.splice(index, 1);
        },
        submitForm() {
            console.log("Submit form with experiences:", this.experiences);
        },
    },
};
</script>
