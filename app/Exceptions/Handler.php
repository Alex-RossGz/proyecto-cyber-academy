<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Yajra\Pdo\Oci8\Exceptions\Oci8Exception;
use MongoDB\Driver\Exception\InvalidArgumentException;
use MongoDB\Exception\Exception as MongoException;

class Handler extends ExceptionHandler
{
    /**
     * A list of exception types with their corresponding custom log levels.
     *
     * @var array<class-string<\Throwable>, \Psr\Log\LogLevel::*>
     */
    protected $levels = [
        //
    ];

    /**
     * A list of the exception types that are not reported.
     *
     * @var array<int, class-string<\Throwable>>
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }

    public function render($request, Throwable $exception)
    {
        if ($exception instanceof Oci8Exception) {
            return response()->view('content.errorOracle', [], 500);
        }
        // else MongoException
        else if ($exception instanceof MongoException or $exception instanceof InvalidArgumentException) {
            return response()->view('content.errorMongo', [], 500);
        }
        else if ($exception instanceof \Exception) {
            return response()->view('content.error', [], 500);
        }

        return parent::render($request, $exception);
    }

}
