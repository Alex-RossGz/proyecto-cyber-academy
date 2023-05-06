<template>
    <!-- A list of inputs, when enter is pressed, the input is added to the list and the input is cleared -->
    <div class="card my-4">
        <div class="card-header bg-secondary text-white">
            Proponer temario
        </div>
        <div class="card-body">
            <div class="input-group mb-3">
                <input type="text" class="form-control" v-model="newItem" @keyup.enter="addItem">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button" @click="addItem">Add</button>
                </div>
            </div>
            <!-- Button to delete and item -->
            <ul class="list-group">
                <li class="list-group item" v-for="(item, index) in items" :key="index">
                    <div class="list-group-item">
                        {{ item }}

                        <button class="btn btn-sm btn-outline-danger float-right ml-auto"
                            @click="removeItem(index.id)">
                            <i class="fa fa-times" aria-hidden="true"></i>
                        </button>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <!-- Unpack items {id, name} as an array of items.name -->
    <input type="hidden" name="temario" :value="items" required>

</template>

<script>
export default {
    data() {
        return {
            newItem: '',
            items: []
        }
    },
    methods: {
        addItem() {
            this.items.push(this.newItem)
            this.newItem = ''
        },
        removeItem(item) {
            this.items.splice(item, 1)
        },
        checkItems() {
            return this.items.length > 0
        }
    }
}
</script>
