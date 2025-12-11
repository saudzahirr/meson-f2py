add_languages('fortran')

py_mod = import('python')
py = py_mod.find_installation(pure: false)
py_dep = py.dependency()

f2py = find_program('f2py', required: true)

incdir_numpy = run_command(py,
  ['-c', 'import numpy; print(numpy.get_include())'],
  check: true
).stdout().strip()

incdir_f2py = run_command(py,
  ['-c', 'import numpy.f2py; print(numpy.f2py.get_include())'],
  check: true
).stdout().strip()

fortranobject_c = run_command(py,
  ['-c', 'import numpy.f2py; import os; print(os.path.join(numpy.f2py.get_include(), "fortranobject.c"))'],
  check: true
).stdout().strip()

py_mod_name = 'addmodule'
add_src = meson.current_source_dir() / 'add.f'

f2py_target = custom_target(
  py_mod_name + '_f2py',
  input: add_src,
  output: [py_mod_name + 'module.c', py_mod_name + '-f2pywrappers.f'],
  command: [
    f2py,
    '@INPUT@',
    '-m', py_mod_name,
    '--lower',
    '--build-dir', meson.current_build_dir()
  ]
)

py.extension_module(
  py_mod_name,
  [add_src, f2py_target, fortranobject_c],
  c_args: ['-I' + incdir_numpy, '-I' + incdir_f2py],
  dependencies: py_dep,
  install: true
)
