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
              <form @submit.prevent="submitForm">
                <div v-for="(email, index) in emails" :key="index" class="mb-4">
                  <div class="form-group">
                    <label :for="'email-' + index">Correo electrónico {{ index + 1 }}</label>
                    <input
                      type="email"
                      class="form-control"
                      :id="'email-' + index"
                      :class="{ 'is-invalid': !isValidEmail(email) }"
                      v-model="emails[index]"
                      @input="validateEmail(email)"
                    />
                    <div v-if="!isValidEmail(email)" class="invalid-feedback">
                      Correo electrónico no válido
                    </div>
                  </div>
                  <button v-if="emails.length > 1" type="button" class="btn btn-danger mt-2" @click="removeEmail(index)">
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
      };
    },
    methods: {
      addEmail() {
        this.emails.push('');
      },
      removeEmail(index) {
        this.emails.splice(index, 1);
      },
      submitForm() {
        console.log('Correos electrónicos:', this.emails);
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
  };
  </script>
