<template>
    <div class="form-group my-5">
        <!-- alert -->
        <div class="alert alert-success" role="alert" v-if="success">
            <i class="fa fa-check-circle" aria-hidden="true"></i>
            {{ message }}
        </div>
        <div class="alert alert-danger" role="alert" v-if="error">
            <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
            {{ message }}
        </div>
        <form action="/update/address" method="PATCH" @submit.prevent="submitForm">
            <div class="display-6 mb-3 text-center">
                <i class="fa fa-pencil" aria-hidden="true"></i>
                {{ title }} dirección
            </div>
            <div class="col-md-12">
                <!-- Country -->
                <div class="form-group row mb-3">
                    <label class="col-md-2 col-form-label">País</label>
                    <div class="col-md-10">
                        <select class="form-control" v-model="address.cve_pais" @change="getCities"
                            :disabled="countries.length == 0" name="cve_pais">
                            <option value="" :selected="address.cve_pais == ''">Seleccione un país</option>
                            <option v-for="country in countries" :value="country.cve_pais" :selected="country.cve_pais == old.cve_pais">{{ country.pais }}</option>
                        </select>
                    </div>

                    <div class="form-text">
                        <span class="text-secondary" v-if="old.pais">
                            Anterior: {{ old.pais }}
                        </span>
                    </div>
                </div>

                <!-- City -->
                <div class="form-group row mb-3">
                    <label class="col-md-2 col-form-label">Ciudad</label>
                    <div class="col-md-10">
                        <select class="form-control" v-model="address.cve_ciudad" :disabled="cities.length == 0"
                            name="cve_ciudad">
                            <option value="" :selected="address.cve_ciudad == ''">Seleccione una ciudad</option>

                            <option v-for="city in cities" :value="city.cve_ciudad" :selected="city.cve_ciudad == old.cve_ciudad">{{ city.ciudad }}</option>
                        </select>
                    </div>

                    <div class="form-text">
                        <span class="text-secondary" v-if="old.ciudad">
                            Anterior: {{ old.ciudad }}
                        </span>
                    </div>
                </div>

                <!-- Address -->
                <div class="form-group row mb-3">
                    <label class="col-md-2 col-form-label">Dirección</label>
                    <div class="col-md-10">
                        <textarea class="form-control" v-model="address.direccion" placeholder="Dirección" rows="3"
                            maxlength="100" name="direccion"></textarea>
                    </div>

                    <div class="form-text">
                        <span class="text-secondary" v-if="old.direccion">
                            Anterior: {{ old.direccion }}
                        </span>
                    </div>
                </div>

                <!-- House Number -->
                <div class="form-group row mb-3">
                    <label class="col-md-2 col-form-label">Número</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" v-model="address.numero" placeholder="Número exterior"
                            maxlength="5" name="numero">
                    </div>

                    <div class="form-text">
                        <span class="text-secondary" v-if="old.numero">
                            Anterior: {{ old.numero }}
                        </span>
                    </div>
                </div>

                <!-- Zip Code -->
                <div class="form-group row mb-3">
                    <label class="col-md-2 col-form-label">Código Postal</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" v-model="address.codigo_postal" placeholder="Código Postal"
                            maxlength="5" name="codigo_postal">
                    </div>

                    <div class="form-text">
                        <span class="text-secondary" v-if="old.codigo_postal">
                            Anterior: {{ old.codigo_postal }}
                        </span>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">
                    <i class="fas fa-save"></i> Guardar dirección
                </button>
            </div>
        </form>

    </div>
</template>
<script>
export default {
    name: "form-address",
    props: ['title', 'old_address'],
    computed: {
        old() {
            return this.old_address ? JSON.parse(this.old_address) : {};
        }
    },
    data() {
        return {
            address: {
                cve_pais: '',
                cve_ciudad: '',
                direccion: '',
                numero: '',
                codigo_postal: ''
            },
            cities: [],
            countries: [],
            error: false,
            success: false,
            message: ''
        }
    },
    mounted() {
        this.getCountries();
        this.address = this.old;

        if (this.old.cve_pais) {
            this.getCities();
        }
    },
    methods: {
        // Get the list of countries from API
        async getCountries() {
            try {
                const response = await axios.get('/api/countries')
                this.countries = response.data;

                console.log(this.countries);
            } catch (error) {
                console.log(error);
            }
        },
        // Get the list of cities based on selected country from API
        async getCities() {
            if (this.address.cve_pais == '') {
                this.cities = [];
                return;
            }
            try {
                const response = await axios.get('/api/cities/' + this.address.cve_pais)
                this.cities = response.data;

                console.log(this.cities);
            } catch (error) {
                console.log(error);
            }
        },
        // Submit the form
        async submitForm() {
            const response = await axios.patch('/update/address', this.address);
            console.log(response.data);

            this.success = response.data.success;
            this.error = response.data.error;
            this.message = response.data.message;

            setTimeout(() => {
                this.success = '';
                this.error = '';
                this.message = '';
            }, 5000);
        }
    }
}
</script>
<style scoped>
/* Set the background color for disabled select elements */
select[disabled] {
    background-color: #d1d1d1;
}
</style>
