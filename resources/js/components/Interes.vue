<template>
    <div class="container my-5">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">
            <div class="card-header bg-primary text-white">
              <h4 class="text-center">
                <i class="fas fa-star"></i> Intereses de aprendizaje
              </h4>
            </div>
            <div class="card-body">
              <form @submit.prevent="submitForm">
                <div v-for="(interest, index) in interests" :key="index" class="mb-4">
                  <div class="form-group">
                    <label :for="'interest-' + index">Interés {{ index + 1 }}</label>
                    <input type="text" class="form-control" :id="'interest-' + index" />
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
      };
    },
    methods: {
      addInterest() {
        this.interests.push('');
      },
      removeInterest(index) {
        this.interests.splice(index, 1);
      },
      submitForm() {
        console.log('Interests:', this.interests);
      },
    },
  };
  </script>
