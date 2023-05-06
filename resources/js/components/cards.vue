<template>
    <div class="card">
        <div class="card-header">
            <slot name="header"></slot>
        </div>
        <div class="card-body" @click="toggle">
            <slot v-if="show">Hello world</slot>
        </div>
    </div>
</template>

<script lang="ts">
export default {
    data() {
        return {
            show: true
        }
    },
    methods: {
        toggle() {
            this.show = !this.show
        }
    },
}
</script>
