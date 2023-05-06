<!-- Este es un componente de dirección para que el usuario pueda editar o ver su dirección: la direccion consta de: cve_pais -> cve_ciudad -> cve_colonia, direccion (texto), numero, codigo postal
PAIS(cve_pais, pais) -> CIUDAD (cve_ciudad, ciudad, cve_pais) -> DIRECCION (cve_direccion, numero, direccion, cve_ciudad)-->

<template>
    <div class="form-group my-5">
        <div class="display-6 mb-3">
            <i class="fa fa-pencil" aria-hidden="true"></i>
            {{title}} dirección
        </div>
        <div class="col-md-12">
            <!-- país -->
            <div class="form-group row mb-3">
                <label class="col-md-2 col-form-label">País</label>
                <div class="col-md-4">
                    <select class="form-control" v-model="address.cve_pais" @change="getCities">
                        <option value="" selected>Seleccione un país</option>
                        <option v-for="country in countries" :value="country.cve_pais">{{ country.pais }}</option>
                    </select>
                </div>

                <div class="form-text">
                    <!-- if is set the property address -->
                    <span class="text-secondary">
                        Anterior: {{ old.pais }}
                    </span>
                </div>
            </div>
            <!-- ciudad -->
            <div class="form-group row mb-3">
                <label class="col-md-2 col-form-label">Ciudad</label>
                <div class="col-md-4">
                    <select class="form-control" v-model="address.cve_ciudad" :disabled="cities.length == 0">
                        <option value="" selected>Seleccione una ciudad</option>
                        <option v-for="city in cities" :value="city.cve_ciudad">{{ city.ciudad }}</option>
                    </select>
                </div>

                <div class="form-text">
                    <!-- if is set the property address -->
                    <span class="text-secondary">
                        Anterior: {{ old.ciudad }}
                    </span>

                </div>
            </div>
            <div class="form-group row mb-3">
                <label class="col-md-2 col-form-label">Dirección</label>
                <div class="col-md-10">
                    <input type="textarea" class="form-control" v-model="address.direccion" placeholder="Dirección">
                </div>

                <div class="form-text">
                    <!-- if is set the property address -->
                    <span class="text-secondary">
                        Anterior: {{ old.direccion }}
                    </span>

                </div>
            </div>
            <div class="form-group row mb-3">
                <label class="col-md-2 col-form-label">Número</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" v-model="address.numero" placeholder="Número exterior">
                </div>

                <div class="form-text">
                    <!-- if is set the property address -->
                    <span class="text-secondary">
                        Anterior: {{ old.numero }}
                    </span>
                </div>
            </div>

            <!-- CP -->
            <div class="form-group row mb-3">
                <label class="col-md-2 col-form-label">Código Postal</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" v-model="address.codigo_postal" placeholder="Código Postal">
                </div>

                <div class="form-text">
                    <!-- if is set the property address -->
                    <span class="text-secondary">
                        Anterior: {{ old.codigo_postal }}
                    </span>

                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: ['title', 'old_address'],

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
            old: ''
        }
    },
    mounted() {
        this.getCountries();
        this.old = JSON.parse(this.old_address ?? '{}');
    },
    methods: {
        getCountries() {
            axios.get('/api/countries')
                .then(response => {
                    this.countries = response.data;
                    console.log(this.countries);
                })
                .catch(error => {
                    console.log(error);
                });
        },
        getCities() {
            if (this.address.cve_pais == '') {
                this.cities = [];
                return;
            }
            axios.get('/api/cities/' + this.address.cve_pais)
                .then(response => {
                    this.cities = response.data;
                    console.log(this.cities);
                })
                .catch(error => {
                    console.log(error);
                });
        },
    }
}
</script>

<style scoped>
select[disabled] {
    background-color: #d1d1d1;
}
</style>
