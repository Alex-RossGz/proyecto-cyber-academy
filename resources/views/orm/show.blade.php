@extends('layouts.app')

@section('content')
<div class="container mt-5">
    <table class="table table-bordered table-striped">
        <thead class="thead-primary">
            <tr>
                @foreach ($columns as $column)
                <th>{{ $column }}</th>
                @endforeach
            </tr>
        </thead>
        <tbody>
            @foreach ($records as $record)
            <tr>
                @foreach ($columns as $column)
                <td>
                    @if(is_array($record->$column) || is_object($record->$column))
                    <ul>
                        @foreach(json_decode($record->$column, true) as $key => $value)
                        <li><strong>{{ $key }}:</strong> {{ $value }}</li>
                        @endforeach
                    </ul>
                    @else
                    {{ $record->$column }}
                    @endif
                </td>

                @endforeach
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
</body>

</html>
@endsection