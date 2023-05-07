<template>
    <div class="alert alert-danger" v-if="error && message">
        <i class="fas fa-exclamation-circle"></i> {{ message }}
    </div>
    <div class="alert" v-if="!error && message" :class="membership === 'basica' ? 'alert-success' : 'alert-info'">
        <i class="fas fa-check-circle"></i> <b>{{ message }}</b>
    </div>
    <form class="payment-form" @submit.prevent="submitForm">
        <div class="form-group">
            <label for="paymentType">Tipo de pago</label>
            <select class="form-control" id="paymentType" v-model="paymentType">
                <option value="single">Pago único</option>
                <option value="months">Pago en meses</option>
            </select>
        </div>

        <div class="form-group" v-if="isInstallmentsVisible">
            <label for="installments">Número de meses</label>
            <input type="number" class="form-control" id="installments" min="1" max="12" v-model="installments" />
        </div>

        <div class="form-group">
            <label for="codigoPromocional">Código promocional</label>
            <input type="text" class="form-control" id="codigoPromocional" maxlength="15" v-model="codigoPromocional" />
        </div>

        <button type="submit" class="btn btn-primary">Proceder al pago</button>
    </form>
</template>

<style scoped>
.payment-form {
    max-width: 500px;
    margin: 0 auto;
}

.payment-form .form-group {
    margin-bottom: 1.5rem;
}

.payment-form button[type="submit"] {
    width: 100%;
}
</style>

<script>
export default {
    props: ["membership", "paymentMethod"],
    data() {
        return {
            paymentType: "single",
            installments: 1,
            codigoPromocional: "",
            message: "",
            error: false,
        };
    },
    // ...

    computed: {
        isInstallmentsVisible() {
            return this.paymentType === "months";
        },
    },
    methods: {
        async submitForm() {
            // /pago/{membership}/{payment_method}
            const { data } = await axios.put(`/pago/${this.membership}/${this.paymentMethod}`, {
                paymentType: this.paymentType,
                installments: this.installments,
                codigoPromocional: this.codigoPromocional,
            });
            if (data.error) {
                this.error = true;
                this.message = data.error;
            }
            else {
                this.error = false;
                this.message = data.success;

                setTimeout(() => {
                    window.location.href = "/";
                }, 2000);
            }


            // window.location.href = "/";
        },
    },
};
</script>
