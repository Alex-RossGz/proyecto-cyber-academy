<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <h2 class="my-4 text-center text-primary">Lista de tu experiencia</h2>
                <div class="alert alert-success alert-dismissible fade show" role="alert" v-if="success">
                    <strong>¡Bien hecho!</strong> {{ message }}
                </div>
                <div class="alert alert-danger alert-dismissible fade show" role="alert" v-if="error">
                    <strong>¡Error!</strong> {{ message }}
                </div>
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
                                        <input type="text" class="form-control" v-model="experience.especialidad"
                                            placeholder="Experiencia" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="initialDate">Fecha inicial</label>
                                        <input type="date" class="form-control" v-model="experience.fecha_inicio" />
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="finalDate">Fecha final</label>
                                        <input type="date" class="form-control" v-model="experience.fecha_fin" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="description">Descripción</label>
                                    <textarea class="form-control" v-model="experience.descripcion" rows="3"
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
                    <div class="d-flex justify-content-center card-footer">
                        <div class="text-center">
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-save"></i> Guardar experiencias
                            </button>
                        </div>
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
                    especialidad: "",
                    fecha_inicio: "",
                    fecha_fin: "",
                    descripcion: "",
                },
            ],
            success: false,
            error: false,
            message: "",
        };
    },
    methods: {
        addExperience() {
            if (this.experiences.length < 5) {
                this.experiences.push({
                    especialidad: "",
                    fecha_inicio: "",
                    fecha_fin: "",
                    descripcion: "",
                },);
            }
        },
        removeExperience(index) {
            this.experiences.splice(index, 1);
        },
        async submitForm() {
            console.log("Submit form with experiences:", this.experiences);

            const response = await axios.patch("/update/experiencia", this.experiences);

            this.success = response.data.success;
            this.error = response.data.error;
            this.message = response.data.message;

            setTimeout(() => {
                this.success = false;
                this.error = false;
                this.message = "";
            }, 3000);
        },
    },
    mounted() {
        axios.get("/get/experiencia").then((response) => {
            this.experiences = response.data.experiencia;
        });
    },
};
</script>
